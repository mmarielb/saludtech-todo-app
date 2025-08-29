import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import ConfirmController from "./controllers/confirm_controller"

const application = Application.start()
application.register("confirm", ConfirmController)



