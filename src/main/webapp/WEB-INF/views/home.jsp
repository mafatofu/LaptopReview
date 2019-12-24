<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="author" content="colorlib.com">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,700" rel="stylesheet" />
    <link href="resources/css/main.css?ver=4" rel="stylesheet" />
  </head>
  <body>
    <div class="s013">
      <form>
        <fieldset>
          <legend>QUICK FIND YOUR CITY</legend>
        </fieldset>
        <div class="inner-form">
          <div class="left">
            <div class="input-wrap first">
              <div class="input-field first">
                <label>WHAT</label>
                <input type="text" placeholder="ex: food, service, bar, hotel" />
              </div>
            </div>
            <div class="input-wrap second">
              <div class="input-field second">
                <label>WHERE</label>
                <div class="input-select">
                  <select data-trigger="" name="choices-single-defaul">
                    <option placeholder="">1 adult</option>
                    <option>2 adults</option>
                    <option>3 adults</option>
                    <option>4 adults</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
          <button class="btn-search" type="button">SEARCH</button>
        </div>
      </form>
    </div>
    <script src="js/extention/choices.js"></script>
    <script>
      const choices = new Choices('[data-trigger]',
      {
        searchEnabled: false,
        itemSelectText: '',
      });

    </script>
  </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>
