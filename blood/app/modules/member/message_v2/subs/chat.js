var router = require( "express" ).Router()
var db = require( "../../../../lib/database" )()
var io = require( "../../../../../" )
var user_id
var id
var email
var mate

router.get( "/", ( req, res ) => {
	res.redirect( "/member/message_v2" )
})

router.get( "/:id", ( req, res ) => {
	user_id = req.session.user.intACCOUNT_ID
	id = req.params.id
	email = req.session.user.strACCOUNT_EMAIL
	const mq = `
		select user1, user2
		from msg_con
		where msg_con_id=${ req.params.id }
	`

	db.query( mq, ( err, out ) => {
		if( out[0].user1 == req.session.user.intACCOUNT_ID )
			mate = out[0].user2
		else
			mate = out[0].user1
		const tq = `select intACCOUNT_ID, strACCOUNT_EMAIL from tblaccounts where intACCOUNT_ID=${ mate } `
		db.query( tq, ( err, out ) => {
			res.render( "member/message_v2/views/chat", {
				mate_det: out[0],
				self_det: {
					intACCOUNT_ID: req.session.user.intACCOUNT_ID,
					strACCOUNT_EMAIL: req.session.user.strACCOUNT_EMAIL
				}
			})
		})
	})
})

io.on( "connection", client => {
	const q = `
		select msg.*, tblaccounts.strACCOUNT_EMAIL as email 
		from msg, tblaccounts
		where
			msg.msg_con_id=${ id } and
			tblaccounts.intACCOUNT_ID=msg.sender
	`

	client.join( id )

	console.log( email + " HAS FRESHLY CONNECTED TO THE CHAT SERVER" )
	client.on( "join", data => {
		db.query( q, ( err, out ) => {
			io.to( id ).emit( "init", out )
		})
	})

	client.on( "messages", data => {
		const q0 = `
			insert into 
			msg( msg_con_id, sender, content )
			values(	
				${ id },
				${ user_id }, 
				"${ data }"
			)
		`
		db.query( q0, ( err, out ) => {
			const q1 = `
				select msg.*, tblaccounts.strACCOUNT_EMAIL as email 
				from msg, tblaccounts
				where
					msg.msg_con_id=${ id } and
					tblaccounts.intACCOUNT_ID=msg.sender and
					msg.msg_id=(
						select max( msg_id )
						from msg
					)
				`
			db.query( q1, ( err, out ) => {
				io.to( id ).emit( "broad", out[0] )
			})
		})
	})

	client.on( "cls", () => {
		io.to( id ).emit( "clear" )
	})

	client.on( "disconnect", () => {
		console.log( email + " HAS DISCONNECTED FROM THE SERVER" )
	})
})

module.exports = router