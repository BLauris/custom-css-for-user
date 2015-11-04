text = "Lorem ipsum dolor sit amet, aut potenti nunc viverra fermentum quis non, nulla a nisl nisl metus tortor, 
        et lacinia vel sem libero. Ut luctus egestas, amet nec tortor. Ipsum ut rutrum felis rutrum pretium malesuada, 
        pede ac et sociis, morbi justo lectus donec purus, fermentum nunc nec quis."

user = User.create(first_name: "Name", 
                   last_name: "Surname", 
                   email: "name.surname@email.com", 
                   text: text)

Style.create(user_id: user.id,
             background_color: 'black',
             block_height: '200px',
             name_color: 'black',
             name_style: 'italic',
             name_size: '20px',
             text_color: 'black',
             text_style: 'none',
             text_size: '10px',
             email_color: 'black',
             email_style: 'none',
             email_size: '12px')