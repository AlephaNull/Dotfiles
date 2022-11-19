static const char norm_fg[] = "#D5C4A1";
static const char norm_bg[] = "#283441";
static const char norm_border[] = "#665c54";

static const char sel_fg[] = "#fbf1c7";
static const char sel_bg[] = "#4b4845";
static const char sel_border[] = "#fbf1c7";

static const char warn_fg[] = "#B34334";
static const char warn_bg[] = "#402a42";
static const char warn_border[] = "#B34334";

static const char urg_fg[] = "#402a42";
static const char urg_bg[] = "#B34334";
static const char urg_border[] = "#fb4934";

static const char col_orange_fg[] = "#D5C4A1";
static const char col_orange_bg[] = "#402a42";
static const char col_orange_border[] = "#fb4934";

static const char col_green_fg[] = "#D5C4A1";
static const char col_green_bg[] = "#B34334";
static const char col_green_border[] = "#B34334";

static const char end_fg[] = "#402a42";
static const char end_bg[] = "#262626";
static const char end_border[] = "#B34334";

static const char *colors[][3]      = {
    /*               fg           bg          border                         */
    [SchemeNorm] =   { norm_fg,   norm_bg,    norm_border }, 		     // unfocused wins
    [SchemeSel]  =   { sel_fg,    sel_bg,     sel_border },		     // the focused win
    [SchemeWarn] =    { warn_fg,    warn_bg,     warn_border },
    [SchemeUrgent]  = { urg_fg, urg_bg,  urg_border },
    [SchemeOrange]  = { col_orange_fg, col_orange_bg, col_orange_border },
    [SchemeGreen]  = { col_green_fg, col_green_bg, col_green_border },
    [SchemeEnd]    = { end_fg,  end_bg, end_border },

};
