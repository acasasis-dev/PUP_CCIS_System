var router = require( "express" ).Router()
var db = require( "../../../lib/database" )()

router.get( "/", ( req, res ) => {
	var user_id = req.session.user.intACCOUNT_ID
	const view = "member/message_v2/views/message"
	const q = `
		select *
		from msg_con
		where
			user1=${ user_id } or
			user2=${ user_id }
	`
	var tmp_mates = []

	db.query( q, ( err, out ) => {
		if( out ) {
			out.forEach( cur => {
				if( cur.user1 == user_id )
					tmp_mates.push( cur.user2 )
				else
					tmp_mates.push( cur.user1 )
			})
		}
		var mates = tmp_mates.join( ", " )

		if( !mates )
			res.render( view, {
				emails: [],
				redr: req.originalUrl + "/chat"
			})
		else {
			const q0 = `
				select 
					tblaccounts.intACCOUNT_ID,
					tblaccounts.strACCOUNT_EMAIL,
					msg_con.msg_con_id
				from tblaccounts, msg_con
				where
					tblaccounts.intACCOUNT_ID in ( ${ mates } ) and
					msg_con.user1=tblaccounts.intACCOUNT_ID and
					msg_con.user2=${ user_id } or
					msg_con.user1=${ user_id } and
					msg_con.user2=tblaccounts.intACCOUNT_ID
			`

			db.query( q0, ( err, out ) => {
				res.render( view, {
					emails: out,
					redr: req.originalUrl + "/chat/"
				})
			})
		}
	})
})

router.get( "/new", ( req, res ) => {
	const user_id = req.session.user.intACCOUNT_ID
	const view = "member/message_v2/views/new_contact"
	const mates_q = `
		select *
		from msg_con
		where
			user1=${ user_id } or
			user2=${ user_id }
	`
	var q = `
		select intACCOUNT_ID, strACCOUNT_EMAIL 
		from tblaccounts 
		where intACCOUNT_ID!=${ user_id }
	`
	var tmp_mates = []

	db.query( mates_q, ( err, out ) => {
		if( out ) {
			out.forEach( cur => {
				if( cur.user1 == user_id )
					tmp_mates.push( cur.user2 )
				else
					tmp_mates.push( cur.user1 )
			})
		}
		var mates = tmp_mates.join( ", " )
		var mq = ` and
			intACCOUNT_ID not in ( ${ mates } )
		`
		var q0 = q + mq 
		var q1 = q + ` and
			strACCOUNT_EMAIL like "%${ req.query.search }%"
		`
		var q2 = q1 + mq

		if( Object.keys( req.query ).length == 0 ) {
			if( !mates ) {
				db.query( q, ( err, out ) => {
					res.render( view, {
						emails: out,
						redr: req.originalUrl
					})
				})
			} else {
				db.query( q0, ( err, out ) => {
					res.render( view, {
						emails: out,
						redr: req.originalUrl
					})
				})
			}
		} else {
			if( !mates ) {
				db.query( q1, ( err, out ) => {
					res.render( view, {
						emails: out,
						redr: req.originalUrl
					})
				})
			} else {
				db.query( q2, ( err, out ) => {
					res.render( view, {
						emails: out,
						redr: req.originalUrl
					})
				})
			}
		}
	})
})

router.post( "/new", ( req, res ) => {
	const q = `
		insert into msg_con( user1, user2 )
		values( ${ req.session.user.intACCOUNT_ID }, ${ req.body.id } )
	`

	db.query( q, ( err, out ) => {
		res.redirect( "/member/message_v2" )
	})
})

router.use( "/chat", require( "./subs/chat" ) )

module.exports = router