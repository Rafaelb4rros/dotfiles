#include <gio/gio.h>

int main() {
	GApplication *application = g_application_new ("pomodoro.notify", G_APPLICATION_FLAGS_NONE);
	g_application_register (application, NULL, NULL);
	GNotification *notification = g_notification_new ("POMODORO!");
	g_notification_set_body (notification, "Pomodoro session just ended!!!.");
	GIcon *icon = g_themed_icon_new ("dialog-information");
	g_notification_set_icon (notification, icon);
	g_application_send_notification (application, NULL, notification);
	g_object_unref (icon);
	g_object_unref (notification);
	g_object_unref (application);
	return 0;
}
