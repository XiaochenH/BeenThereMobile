CREATE TABLE IF NOT EXISTS user_basic (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_level INTEGER DEFAULT 1,
    user_name TEXT UNIQUE NOT NULL,
    password TEXT
);

CREATE TABLE IF NOT EXISTS article_basic (
    article_id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_user_id INTEGER,
    title VARCHAR(60) UNIQUE NOT NULL,
    visible INTEGER DEFAULT 1,
    FOREIGN KEY (post_user_id) REFERENCES user_basic(user_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tag (
    tag_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tag_title VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS messages (
    message_id INTEGER PRIMARY KEY AUTOINCREMENT,
    sender_id INTEGER,
    receiver_id INTEGER,
    send_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES user_basic(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES user_basic(user_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS user_info (
    user_id INTEGER,
    email VARCHAR(30),
    dob DATE DEFAULT CURRENT_DATE,
    register_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_exit_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_basic(user_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS article_info (
    article_id INTEGER,
    user_id INTEGER,
    view_count INTEGER DEFAULT 0,
    save_count INTEGER DEFAULT 0,
    content TEXT,
    post_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (article_id) REFERENCES article_basic(article_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES user_basic(user_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS friendship (
    inviter_id INTEGER,
    receiver_id INTEGER,
    friend_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (inviter_id) REFERENCES user_basic(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES user_basic(user_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tag_connect (
    user_id INTEGER,
    article_id INTEGER,
    tag_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES user_basic(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (article_id) REFERENCES article_basic(article_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tag(tag_id) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT null_check CHECK (user_id NOT NULL OR article_id NOT NULL)
);
