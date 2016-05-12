import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main: Program Never
main =
    Html.beginnerProgram { model = model, view = view, update = update }


type alias Model =
    { username: String
    , password: String
    , passwordAgain: String
    }

model: Model
model =
    Model "" "" ""


type Action = Name String | Password String | PasswordAgain String

update: Action -> Model -> Model
update action model =
    case action of
        Name name ->
            { model | username = name }

        Password pw ->
            { model | password = pw }

        PasswordAgain pw ->
            { model | passwordAgain = pw }



view: Model -> Html Action
view model =
    div [] [
        Html.input [ type' "text", placeholder "Name Here", onInput Name] [],
        Html.input [ type' "password", placeholder "password", onInput Password ] [],
        Html.input [ type' "password", placeholder "password again again", onInput PasswordAgain ] [],
        viewValidation model
    ]

viewValidation: Model -> Html Action
viewValidation model =
    let (color, message) =
        if model.password == model.passwordAgain then
            ("yellow", "OK")
        else
            ("red", "Password do not match!")
    in
        div [ style [("color", color)] ]
            [ text message ]