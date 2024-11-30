import logging


def get_logger(name, level=logging.INFO):
    """
    This function returns a logger object that can be used to
    log messages to the console
    it sets some basic formatting and defaults to a logging level of INFO

    Args:
        name (_type_): ideally this should be the name of the module/file that
        is calling this function
        level (_type_, optional): _description_. Defaults to logging.INFO.

    Returns:
        _logger_: logger object
    """
    logger = logging.getLogger(name)
    logger.setLevel(level)
    formatter = logging.Formatter(
        "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
    )
    ch = logging.StreamHandler()
    ch.setFormatter(formatter)
    logger.addHandler(ch)
    return logger
