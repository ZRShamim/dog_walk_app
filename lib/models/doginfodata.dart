const List dogList = [
  {
    'name': 'Austin',
    'img':
        'https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80',
    'age': '4 months',
    'size': 'small',
    'sex': 'Female',
    'location': 'Kastanienallee, Berlin',
    'service_type': 'Dog Walking',
    'service_fee': 12,
    'details':
        'Austin is lovely and well trained dog. She loves to pull a little bit when she sees other dogs.',
    'owner': 'Ben parker',
    'owner_img':
        'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'owner_mail': 'hello@benparker.com',
    'service_day': 'Weekdays',
    'service_time': '7:00',
    'service_time_span': 1,
    'service_hours': [
      {
        'day': 'Mon',
        'service_hour': '7AM - 8Am',
        'is_booked': true,
      },
      {
        'day': 'Tue',
        'service_hour': '7AM - 8Am',
        'is_booked': false,
      },
      {
        'day': 'Wed',
        'service_hour': '7AM - 8Am',
        'is_booked': false,
      },
      {
        'day': 'Thu',
        'service_hour': '7AM - 8Am',
        'is_booked': true,
      },
      {
        'day': 'Fri',
        'service_hour': '7AM - 8Am',
        'is_booked': false,
      },
    ]
  },
  {
    'name': 'Pug',
    'img':
        'https://images.unsplash.com/photo-1517849845537-4d257902454a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
    'age': '6 months',
    'size': 'small',
    'sex': 'Female',
    'location': 'Kastanienallee, Berlin',
    'service_type': 'Day Care',
    'service_fee': 18,
    'details':
        'Pug is lovely and well trained dog. She loves to pull a little bit when she sees other dogs.',
    'owner': 'David Warner',
    'owner_img':
        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
    'owner_mail': 'hello@davidwarner.com',
    'service_day': 'Weekends',
    'service_time': '8:30 - 15:30',
    'service_time_span': 7,
    'service_hours': [
      {
        'day': 'Sat',
        'service_hour': '8:30AM - 3:30PM',
        'is_booked': true,
      },
      {
        'day': 'Sun',
        'service_hour': '8:30AM - 3:30PM',
        'is_booked': false,
      },
    ]
  },
  {
    'name': 'Bulldog',
    'img':
        'https://images.unsplash.com/photo-1583511655857-d19b40a7a54e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
    'age': '4 months',
    'size': 'small',
    'sex': 'Male',
    'location': 'Kastanienallee, Berlin',
    'service_type': 'Day Care',
    'service_fee': 13.5,
    'details':
        'Penne is lovely and well trained dog. She loves to pull a little bit when she sees other dogs.',
    'owner': 'Jurica Koletić',
    'owner_img':
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'owner_mail': 'hello@juricakoletić.com',
    'service_day': 'Mondays',
    'service_time': '14:00 - 20:00',
    'service_time_span': 6,
    'service_hours': [
      {
        'day': 'Mon',
        'service_hour': '2PM - 8Am',
        'is_booked': false,
      },
    ]
  },
];

const List searchOption = [
  'price hourly: min 10',
  'small dogs',
];

const List bottomNav = [
  {
    'icon': 'assets/svg_icons/home.svg',
    'title': 'Home',
  },
  {
    'icon': 'assets/svg_icons/dog.svg',
    'title': 'Activities',
  },
  {
    'icon': '/assets/svg_icons/user.svg',
    'title': 'Profile',
  }
];
