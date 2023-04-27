import express from 'express';

import activate_session from './middlewares/session.mdw.js';
import activate_views from './middlewares/view.mdw.js';
import activate_resLocals from './middlewares/locals.mdw.js';
import activate_routes from './middlewares/routes.mdw.js';
import activate_error_handlers from './middlewares/error.mdw.js';
import path, {dirname} from "path";
import {fileURLToPath} from "url";
import {engine} from "express-handlebars";
import hbs_sections from "express-handlebars-sections";


const __dirname = dirname(fileURLToPath(import.meta.url));

const app = express();
app.use('/public', express.static(path.join(__dirname, 'public')));
// cho sử dụng req.body khi dùng POST
app.use(express.urlencoded({
  extended: true
}));

activate_session(app);
activate_views(app);
activate_resLocals(app);
activate_routes(app);
activate_error_handlers(app);

app.engine('hbs', engine({
  extname: 'hbs',
  defaultLayout: 'home.hbs',
  helpers: {
    section: hbs_sections(),
  }
}));

app.set('view engine', 'hbs');
app.set('views', __dirname + '/views');

const PORT = 4000;
app.listen(PORT, function () {
  console.log(`http://localhost:${PORT}`);
});

