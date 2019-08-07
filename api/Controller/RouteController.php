<?php

namespace api\Controller;

class RouteController
{

    private $_listUri = [];
    private $_listCall = [];

    /**
     * @param string $uri A path such as about/system
     * @param object $function An anonymous function
     */
    public function add($uri, $function)
    {
        $uri = trim($uri, '/\^$');
        $this->_listUri[] = $uri;
        $this->_listCall[] = $function;
    }

    /**
     * listen
     * @desc Looks for a match for the URI and runs the related function
     */
    public function run()
    {
        $uri = isset($_REQUEST['uri']) ? $_REQUEST['uri'] : '/';
        $uri = trim($uri, '/\^$');
        $replacementValues = [];

        foreach ($this->_listUri as $listKey => $listUri) {

            if (preg_match("#^$listUri$#", $uri)) {

                $realUri = explode('/', $uri);
                $fakeUri = explode('/', $listUri);

                // Replace the .+ values with the real values in the URI
                foreach ($fakeUri as $key => $value) {
                    if ($value == '.+') {
                        $replacementValues[] = $realUri[$key];
                    }
                }

                //Pass an array for arguments
                call_user_func_array($this->_listCall[$listKey], $replacementValues);
            }
        }
    }
}