// app/javascript/controllers/index.js

import { Application } from 'stimulus';
import { definitionsFromContext } from 'stimulus/webpack-helpers';
import NotificationController from './notification_controller';

const application = Application.start();
const context = require.context('../controllers', true, /\.js$/);

// Register specific controllers
application.register('notification', NotificationController);

// Load all controllers from the context
application.load(definitionsFromContext(context));
