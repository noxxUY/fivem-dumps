(self.webpackChunksrc_htmlphone=self.webpackChunksrc_htmlphone||[]).push([[4410],{4410:function(__unused_webpack_module,__webpack_exports__,__webpack_require__){"use strict";eval("\n// EXPORTS\n__webpack_require__.d(__webpack_exports__, {\n  \"Z\": function() { return /* binding */ components_Modal; }\n});\n\n// EXTERNAL MODULE: ./node_modules/vue/dist/vue.esm.js\nvar vue_esm = __webpack_require__(538);\n;// CONCATENATED MODULE: ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib/index.js??vue-loader-options!./src/components/Modal/Modal.vue?vue&type=template&id=29b4327b&scoped=true&\nvar render = function () {var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;return _c('transition',{attrs:{\"name\":\"modal\"}},[_c('div',{staticClass:\"modal-mask\",on:{\"click\":function($event){$event.stopPropagation();return _vm.cancel($event)}}},[_c('div',{staticClass:\"modal-container\"},_vm._l((_vm.choix),function(val,index){return _c('div',{key:index,staticClass:\"modal-choix\",class:{ select: index === _vm.currentSelect},style:({color: val.color}),on:{\"click\":function($event){$event.stopPropagation();return _vm.selectItem(val)}}},[_c('div',{staticClass:\"fa-icon\"},[_c('FontAwesomeIcon',{attrs:{\"icon\":['fas', val.icons]},on:{\"click\":function($event){$event.stopPropagation();return _vm.selectItem(val)}}}),_vm._v(\" \"+_vm._s(val.title)+\"\\n        \")],1)])}),0)])])}\nvar staticRenderFns = []\n\n\n// EXTERNAL MODULE: ./node_modules/@babel/runtime/helpers/esm/defineProperty.js\nvar defineProperty = __webpack_require__(6156);\n// EXTERNAL MODULE: ./src/store/index.js + 10 modules\nvar store = __webpack_require__(7776);\n// EXTERNAL MODULE: ./node_modules/vuex/dist/vuex.esm.js\nvar vuex_esm = __webpack_require__(629);\n;// CONCATENATED MODULE: ./node_modules/babel-loader/lib/index.js!./node_modules/vue-loader/lib/index.js??vue-loader-options!./src/components/Modal/Modal.vue?vue&type=script&lang=js&\n\n\nfunction ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }\n\nfunction _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { (0,defineProperty/* default */.Z)(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }\n\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n\n\n/* harmony default export */ var Modalvue_type_script_lang_js_ = ({\n  name: 'Modal',\n  store: store/* default */.Z,\n  props: {\n    choix: {\n      type: Array,\n      default: function _default() {\n        return [];\n      }\n    }\n  },\n  data: function data() {\n    return {\n      currentSelect: 0\n    };\n  },\n  computed: _objectSpread({}, (0,vuex_esm/* mapGetters */.Se)(['useMouse'])),\n  created: function created() {\n    if (!this.useMouse) {\n      this.$bus.$on('keyUpArrowDown', this.onDown);\n      this.$bus.$on('keyUpArrowUp', this.onUp);\n      this.$bus.$on('keyUpEnter', this.onEnter);\n    } else {\n      this.currentSelect = -1;\n    }\n\n    this.$bus.$on('keyUpBackspace', this.cancel);\n  },\n  beforeDestroy: function beforeDestroy() {\n    this.$bus.$off('keyUpArrowDown', this.onDown);\n    this.$bus.$off('keyUpArrowUp', this.onUp);\n    this.$bus.$off('keyUpEnter', this.onEnter);\n    this.$bus.$off('keyUpBackspace', this.cancel);\n  },\n  methods: {\n    scrollIntoViewIfNeeded: function scrollIntoViewIfNeeded() {\n      this.$nextTick(function () {\n        document.querySelector('.modal-choix.select').scrollIntoViewIfNeeded();\n      });\n    },\n    onUp: function onUp() {\n      this.currentSelect = this.currentSelect === 0 ? 0 : this.currentSelect - 1;\n      this.scrollIntoViewIfNeeded();\n    },\n    onDown: function onDown() {\n      this.currentSelect = this.currentSelect === this.choix.length - 1 ? this.currentSelect : this.currentSelect + 1;\n      this.scrollIntoViewIfNeeded();\n    },\n    selectItem: function selectItem(elem) {\n      this.$emit('select', elem);\n    },\n    onEnter: function onEnter() {\n      this.$emit('select', this.choix[this.currentSelect]);\n    },\n    cancel: function cancel() {\n      this.$emit('cancel');\n    }\n  }\n});\n;// CONCATENATED MODULE: ./src/components/Modal/Modal.vue?vue&type=script&lang=js&\n /* harmony default export */ var Modal_Modalvue_type_script_lang_js_ = (Modalvue_type_script_lang_js_); \n// EXTERNAL MODULE: ./node_modules/vue-loader/lib/runtime/componentNormalizer.js\nvar componentNormalizer = __webpack_require__(1900);\n;// CONCATENATED MODULE: ./src/components/Modal/Modal.vue\n\n\n\n;\n\n\n/* normalize component */\n\nvar component = (0,componentNormalizer/* default */.Z)(\n  Modal_Modalvue_type_script_lang_js_,\n  render,\n  staticRenderFns,\n  false,\n  null,\n  \"29b4327b\",\n  null\n  \n)\n\n/* harmony default export */ var Modal = (component.exports);\n;// CONCATENATED MODULE: ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib/index.js??vue-loader-options!./src/components/Modal/TextModal.vue?vue&type=template&id=112d0497&scoped=true&\nvar TextModalvue_type_template_id_112d0497_scoped_true_render = function () {var _vm=this;var _h=_vm.$createElement;var _c=_vm._self._c||_h;return _c('transition',{attrs:{\"name\":\"modal\"}},[_c('div',{staticClass:\"modal-mask\"},[_c('div',{staticClass:\"modal-container\",on:{\"click\":function($event){$event.stopPropagation();}}},[_c('h2',{style:({color: _vm.color})},[_vm._v(\"\\n        \"+_vm._s(_vm.title)+\"\\n      \")]),_vm._v(\" \"),_c('textarea',{directives:[{name:\"model\",rawName:\"v-model\",value:(_vm.inputText),expression:\"inputText\"}],ref:\"textarea\",staticClass:\"modal-textarea\",class:{oneline: _vm.limit <= 18},style:({borderColor: _vm.color}),attrs:{\"maxlength\":_vm.limit},domProps:{\"value\":(_vm.inputText)},on:{\"input\":function($event){if($event.target.composing){ return; }_vm.inputText=$event.target.value}}}),_vm._v(\" \"),_c('div',{staticClass:\"botton-container\"},[_c('button',{style:({color: _vm.color}),on:{\"click\":_vm.cancel}},[_vm._v(\"\\n          \"+_vm._s(_vm.IntlString('CANCEL'))+\"\\n        \")]),_vm._v(\" \"),_c('button',{style:({color: _vm.color}),on:{\"click\":_vm.valide}},[_vm._v(\"\\n          \"+_vm._s(_vm.IntlString('OK'))+\"\\n        \")])])])])])}\nvar TextModalvue_type_template_id_112d0497_scoped_true_staticRenderFns = []\n\n\n;// CONCATENATED MODULE: ./node_modules/babel-loader/lib/index.js!./node_modules/vue-loader/lib/index.js??vue-loader-options!./src/components/Modal/TextModal.vue?vue&type=script&lang=js&\n\n\nfunction TextModalvue_type_script_lang_js_ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }\n\nfunction TextModalvue_type_script_lang_js_objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { TextModalvue_type_script_lang_js_ownKeys(Object(source), true).forEach(function (key) { (0,defineProperty/* default */.Z)(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { TextModalvue_type_script_lang_js_ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }\n\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n//\n\n\n/* harmony default export */ var TextModalvue_type_script_lang_js_ = ({\n  name: 'TextModal',\n  store: store/* default */.Z,\n  props: {\n    title: {\n      type: String,\n      default: function _default() {\n        return '';\n      }\n    },\n    text: {\n      type: String,\n      default: function _default() {\n        return '';\n      }\n    },\n    limit: {\n      type: Number,\n      default: 255\n    }\n  },\n  data: function data() {\n    return {\n      inputText: ''\n    };\n  },\n  computed: TextModalvue_type_script_lang_js_objectSpread(TextModalvue_type_script_lang_js_objectSpread({}, (0,vuex_esm/* mapGetters */.Se)(['IntlString', 'themeColor'])), {}, {\n    color: function color() {\n      return this.themeColor || '#2A56C6';\n    }\n  }),\n  created: function created() {\n    this.inputText = this.text;\n  },\n  mounted: function mounted() {\n    var _this = this;\n\n    this.$nextTick(function () {\n      _this.$refs.textarea.focus();\n    });\n  },\n  beforeDestroy: function beforeDestroy() {},\n  methods: {\n    scrollIntoViewIfNeeded: function scrollIntoViewIfNeeded() {\n      this.$nextTick(function () {\n        document.querySelector('.modal-choix.select').scrollIntoViewIfNeeded();\n      });\n    },\n    onUp: function onUp() {\n      this.currentSelect = this.currentSelect === 0 ? 0 : this.currentSelect - 1;\n      this.scrollIntoViewIfNeeded();\n    },\n    onDown: function onDown() {\n      this.currentSelect = this.currentSelect === this.choix.length - 1 ? this.currentSelect : this.currentSelect + 1;\n      this.scrollIntoViewIfNeeded();\n    },\n    selectItem: function selectItem(elem) {\n      this.$emit('select', elem);\n    },\n    onEnter: function onEnter() {\n      this.$emit('select', this.choix[this.currentSelect]);\n    },\n    cancel: function cancel() {\n      this.$emit('cancel');\n    },\n    valide: function valide() {\n      this.$emit('valid', {\n        text: this.inputText\n      });\n    }\n  }\n});\n;// CONCATENATED MODULE: ./src/components/Modal/TextModal.vue?vue&type=script&lang=js&\n /* harmony default export */ var Modal_TextModalvue_type_script_lang_js_ = (TextModalvue_type_script_lang_js_); \n;// CONCATENATED MODULE: ./src/components/Modal/TextModal.vue\n\n\n\n;\n\n\n/* normalize component */\n\nvar TextModal_component = (0,componentNormalizer/* default */.Z)(\n  Modal_TextModalvue_type_script_lang_js_,\n  TextModalvue_type_template_id_112d0497_scoped_true_render,\n  TextModalvue_type_template_id_112d0497_scoped_true_staticRenderFns,\n  false,\n  null,\n  \"112d0497\",\n  null\n  \n)\n\n/* harmony default export */ var TextModal = (TextModal_component.exports);\n// EXTERNAL MODULE: ./src/PhoneAPI.js + 2 modules\nvar PhoneAPI = __webpack_require__(9265);\n;// CONCATENATED MODULE: ./src/components/Modal/index.js\n\n\n\n\n\n/* harmony default export */ var components_Modal = ({\n  CreateModal: function CreateModal() {\n    var propsData = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};\n    return new Promise(function (resolve) {\n      var modal = new (vue_esm/* default.extend */.Z.extend(Modal))({\n        el: document.createElement('div'),\n        propsData: propsData\n      });\n      document.querySelector('#app').appendChild(modal.$el);\n      modal.$on('select', function (data) {\n        resolve(data);\n        modal.$el.parentNode.removeChild(modal.$el);\n        modal.$destroy();\n      });\n      modal.$on('cancel', function () {\n        resolve({\n          title: 'cancel'\n        });\n        modal.$el.parentNode.removeChild(modal.$el);\n        modal.$destroy();\n      });\n    });\n  },\n  CreateTextModal: function CreateTextModal() {\n    var _this = this;\n\n    var propsData = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};\n\n    if (store/* default.getters.useMouse */.Z.getters.useMouse === false) {\n      return PhoneAPI/* default.getReponseText */.Z.getReponseText(propsData);\n    }\n\n    return new Promise(function (resolve, reject) {\n      var modal = new (vue_esm/* default.extend */.Z.extend(TextModal))({\n        el: document.createElement('div'),\n        propsData: propsData\n      });\n      document.querySelector('#app').appendChild(modal.$el);\n      modal.$on('valid', function (data) {\n        resolve(data);\n        modal.$el.parentNode.removeChild(modal.$el);\n        modal.$destroy();\n      });\n      modal.$on('cancel', function () {\n        reject('UserCancel');\n        modal.$el.parentNode.removeChild(modal.$el);\n        modal.$destroy();\n      });\n    }).catch(function () {\n      return _this.$phoneAPI.log('UserCancel');\n    });\n  }\n});//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly9zcmNfaHRtbHBob25lLy4vc3JjL2NvbXBvbmVudHMvTW9kYWwvTW9kYWwudnVlPzI4YzAiLCJ3ZWJwYWNrOi8vc3JjX2h0bWxwaG9uZS9zcmMvY29tcG9uZW50cy9Nb2RhbC9Nb2RhbC52dWU/OWNiNSIsIndlYnBhY2s6Ly9zcmNfaHRtbHBob25lLy4vc3JjL2NvbXBvbmVudHMvTW9kYWwvTW9kYWwudnVlP2Q2NGUiLCJ3ZWJwYWNrOi8vc3JjX2h0bWxwaG9uZS8uL3NyYy9jb21wb25lbnRzL01vZGFsL01vZGFsLnZ1ZT8zNGM0Iiwid2VicGFjazovL3NyY19odG1scGhvbmUvLi9zcmMvY29tcG9uZW50cy9Nb2RhbC9UZXh0TW9kYWwudnVlP2RiNjgiLCJ3ZWJwYWNrOi8vc3JjX2h0bWxwaG9uZS9zcmMvY29tcG9uZW50cy9Nb2RhbC9UZXh0TW9kYWwudnVlPzI5ODMiLCJ3ZWJwYWNrOi8vc3JjX2h0bWxwaG9uZS8uL3NyYy9jb21wb25lbnRzL01vZGFsL1RleHRNb2RhbC52dWU/NTBlZSIsIndlYnBhY2s6Ly9zcmNfaHRtbHBob25lLy4vc3JjL2NvbXBvbmVudHMvTW9kYWwvVGV4dE1vZGFsLnZ1ZT8xYTVmIiwid2VicGFjazovL3NyY19odG1scGhvbmUvLi9zcmMvY29tcG9uZW50cy9Nb2RhbC9pbmRleC5qcz9mZDBkIl0sIm5hbWVzIjpbIkNyZWF0ZU1vZGFsIiwicHJvcHNEYXRhIiwiUHJvbWlzZSIsInJlc29sdmUiLCJtb2RhbCIsIlZ1ZSIsIk1vZGFsIiwiZWwiLCJkb2N1bWVudCIsImNyZWF0ZUVsZW1lbnQiLCJxdWVyeVNlbGVjdG9yIiwiYXBwZW5kQ2hpbGQiLCIkZWwiLCIkb24iLCJkYXRhIiwicGFyZW50Tm9kZSIsInJlbW92ZUNoaWxkIiwiJGRlc3Ryb3kiLCJ0aXRsZSIsIkNyZWF0ZVRleHRNb2RhbCIsInN0b3JlIiwiUGhvbmVBUEkiLCJyZWplY3QiLCJUZXh0TW9kYWwiLCJjYXRjaCIsIiRwaG9uZUFQSSIsImxvZyJd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TjtBQUNELE9BSkQ7QUFLQWIsV0FBSyxDQUFDUyxHQUFOLENBQVUsUUFBVixFQUFvQixZQUFNO0FBQ3hCUyxjQUFNLENBQUMsWUFBRCxDQUFOO0FBQ0FsQixhQUFLLENBQUNRLEdBQU4sQ0FBVUcsVUFBVixDQUFxQkMsV0FBckIsQ0FBaUNaLEtBQUssQ0FBQ1EsR0FBdkM7QUFDQVIsYUFBSyxDQUFDYSxRQUFOO0FBQ0QsT0FKRDtBQUtELEtBaEJNLEVBZ0JKTyxLQWhCSSxDQWdCRTtBQUFBLGFBQU0sS0FBSSxDQUFDQyxTQUFMLENBQWVDLEdBQWYsQ0FBbUIsWUFBbkIsQ0FBTjtBQUFBLEtBaEJGLENBQVA7QUFpQkQ7QUF6Q1ksQ0FBZiIsImZpbGUiOiI0NDEwLmpzIiwic291cmNlc0NvbnRlbnQiOlsidmFyIHJlbmRlciA9IGZ1bmN0aW9uICgpIHt2YXIgX3ZtPXRoaXM7dmFyIF9oPV92bS4kY3JlYXRlRWxlbWVudDt2YXIgX2M9X3ZtLl9zZWxmLl9jfHxfaDtyZXR1cm4gX2MoJ3RyYW5zaXRpb24nLHthdHRyczp7XCJuYW1lXCI6XCJtb2RhbFwifX0sW19jKCdkaXYnLHtzdGF0aWNDbGFzczpcIm1vZGFsLW1hc2tcIixvbjp7XCJjbGlja1wiOmZ1bmN0aW9uKCRldmVudCl7JGV2ZW50LnN0b3BQcm9wYWdhdGlvbigpO3JldHVybiBfdm0uY2FuY2VsKCRldmVudCl9fX0sW19jKCdkaXYnLHtzdGF0aWNDbGFzczpcIm1vZGFsLWNvbnRhaW5lclwifSxfdm0uX2woKF92bS5jaG9peCksZnVuY3Rpb24odmFsLGluZGV4KXtyZXR1cm4gX2MoJ2Rpdicse2tleTppbmRleCxzdGF0aWNDbGFzczpcIm1vZGFsLWNob2l4XCIsY2xhc3M6eyBzZWxlY3Q6IGluZGV4ID09PSBfdm0uY3VycmVudFNlbGVjdH0sc3R5bGU6KHtjb2xvcjogdmFsLmNvbG9yfSksb246e1wiY2xpY2tcIjpmdW5jdGlvbigkZXZlbnQpeyRldmVudC5zdG9wUHJvcGFnYXRpb24oKTtyZXR1cm4gX3ZtLnNlbGVjdEl0ZW0odmFsKX19fSxbX2MoJ2Rpdicse3N0YXRpY0NsYXNzOlwiZmEtaWNvblwifSxbX2MoJ0ZvbnRBd2Vzb21lSWNvbicse2F0dHJzOntcImljb25cIjpbJ2ZhcycsIHZhbC5pY29uc119LG9uOntcImNsaWNrXCI6ZnVuY3Rpb24oJGV2ZW50KXskZXZlbnQuc3RvcFByb3BhZ2F0aW9uKCk7cmV0dXJuIF92bS5zZWxlY3RJdGVtKHZhbCl9fX0pLF92bS5fdihcIiBcIitfdm0uX3ModmFsLnRpdGxlKStcIlxcbiAgICAgICAgXCIpXSwxKV0pfSksMCldKV0pfVxudmFyIHN0YXRpY1JlbmRlckZucyA9IFtdXG5cbmV4cG9ydCB7IHJlbmRlciwgc3RhdGljUmVuZGVyRm5zIH0iLCI8dGVtcGxhdGU+XG4gIDx0cmFuc2l0aW9uIG5hbWU9XCJtb2RhbFwiPlxuICAgIDxkaXZcbiAgICAgIGNsYXNzPVwibW9kYWwtbWFza1wiXG4gICAgICBAY2xpY2suc3RvcD1cImNhbmNlbFwiXG4gICAgPlxuICAgICAgPGRpdiBjbGFzcz1cIm1vZGFsLWNvbnRhaW5lclwiPlxuICAgICAgICA8ZGl2XG4gICAgICAgICAgdi1mb3I9XCIodmFsLCBpbmRleCkgaW4gY2hvaXhcIlxuICAgICAgICAgIDprZXk9XCJpbmRleFwiXG4gICAgICAgICAgY2xhc3M9XCJtb2RhbC1jaG9peFwiXG4gICAgICAgICAgOmNsYXNzPVwieyBzZWxlY3Q6IGluZGV4ID09PSBjdXJyZW50U2VsZWN0fVwiXG4gICAgICAgICAgOnN0eWxlPVwie2NvbG9yOiB2YWwuY29sb3J9XCJcbiAgICAgICAgICBAY2xpY2suc3RvcD1cInNlbGVjdEl0ZW0odmFsKVwiXG4gICAgICAgID5cbiAgICAgICAgICA8ZGl2IGNsYXNzPVwiZmEtaWNvblwiPlxuICAgICAgICAgICAgPEZvbnRBd2Vzb21lSWNvblxuICAgICAgICAgICAgICA6aWNvbj1cIlsnZmFzJywgdmFsLmljb25zXVwiXG4gICAgICAgICAgICAgIEBjbGljay5zdG9wPVwic2VsZWN0SXRlbSh2YWwpXCJcbiAgICAgICAgICAgIC8+IHt7IHZhbC50aXRsZSB9fVxuICAgICAgICAgIDwvZGl2PlxuICAgICAgICA8L2Rpdj5cbiAgICAgIDwvZGl2PlxuICAgIDwvZGl2PlxuICA8L3RyYW5zaXRpb24+XG48L3RlbXBsYXRlPlxuXG48c2NyaXB0PlxuaW1wb3J0IHN0b3JlIGZyb20gJy4vLi4vLi4vc3RvcmUnXG5pbXBvcnQgeyBtYXBHZXR0ZXJzIH0gZnJvbSAndnVleCdcblxuZXhwb3J0IGRlZmF1bHQge1xuICBuYW1lOiAnTW9kYWwnLFxuICBzdG9yZTogc3RvcmUsXG4gIHByb3BzOiB7XG4gICAgY2hvaXg6IHtcbiAgICAgIHR5cGU6IEFycmF5LFxuICAgICAgZGVmYXVsdDogKCkgPT4gW11cbiAgICB9XG4gIH0sXG4gIGRhdGEgKCkge1xuICAgIHJldHVybiB7XG4gICAgICBjdXJyZW50U2VsZWN0OiAwXG4gICAgfVxuICB9LFxuICBjb21wdXRlZDoge1xuICAgIC4uLm1hcEdldHRlcnMoWyd1c2VNb3VzZSddKVxuICB9LFxuICBjcmVhdGVkICgpIHtcbiAgICBpZiAoIXRoaXMudXNlTW91c2UpIHtcbiAgICAgIHRoaXMuJGJ1cy4kb24oJ2tleVVwQXJyb3dEb3duJywgdGhpcy5vbkRvd24pXG4gICAgICB0aGlzLiRidXMuJG9uKCdrZXlVcEFycm93VXAnLCB0aGlzLm9uVXApXG4gICAgICB0aGlzLiRidXMuJG9uKCdrZXlVcEVudGVyJywgdGhpcy5vbkVudGVyKVxuICAgIH0gZWxzZSB7XG4gICAgICB0aGlzLmN1cnJlbnRTZWxlY3QgPSAtMVxuICAgIH1cbiAgICB0aGlzLiRidXMuJG9uKCdrZXlVcEJhY2tzcGFjZScsIHRoaXMuY2FuY2VsKVxuICB9LFxuICBiZWZvcmVEZXN0cm95ICgpIHtcbiAgICB0aGlzLiRidXMuJG9mZigna2V5VXBBcnJvd0Rvd24nLCB0aGlzLm9uRG93bilcbiAgICB0aGlzLiRidXMuJG9mZigna2V5VXBBcnJvd1VwJywgdGhpcy5vblVwKVxuICAgIHRoaXMuJGJ1cy4kb2ZmKCdrZXlVcEVudGVyJywgdGhpcy5vbkVudGVyKVxuICAgIHRoaXMuJGJ1cy4kb2ZmKCdrZXlVcEJhY2tzcGFjZScsIHRoaXMuY2FuY2VsKVxuICB9LFxuICBtZXRob2RzOiB7XG4gICAgc2Nyb2xsSW50b1ZpZXdJZk5lZWRlZCAoKSB7XG4gICAgICB0aGlzLiRuZXh0VGljaygoKSA9PiB7XG4gICAgICAgIGRvY3VtZW50LnF1ZXJ5U2VsZWN0b3IoJy5tb2RhbC1jaG9peC5zZWxlY3QnKS5zY3JvbGxJbnRvVmlld0lmTmVlZGVkKClcbiAgICAgIH0pXG4gICAgfSxcbiAgICBvblVwICgpIHtcbiAgICAgIHRoaXMuY3VycmVudFNlbGVjdCA9IHRoaXMuY3VycmVudFNlbGVjdCA9PT0gMCA/IDAgOiB0aGlzLmN1cnJlbnRTZWxlY3QgLSAxXG4gICAgICB0aGlzLnNjcm9sbEludG9WaWV3SWZOZWVkZWQoKVxuICAgIH0sXG4gICAgb25Eb3duICgpIHtcbiAgICAgIHRoaXMuY3VycmVudFNlbGVjdCA9IHRoaXMuY3VycmVudFNlbGVjdCA9PT0gdGhpcy5jaG9peC5sZW5ndGggLSAxID8gdGhpcy5jdXJyZW50U2VsZWN0IDogdGhpcy5jdXJyZW50U2VsZWN0ICsgMVxuICAgICAgdGhpcy5zY3JvbGxJbnRvVmlld0lmTmVlZGVkKClcbiAgICB9LFxuICAgIHNlbGVjdEl0ZW0gKGVsZW0pIHtcbiAgICAgIHRoaXMuJGVtaXQoJ3NlbGVjdCcsIGVsZW0pXG4gICAgfSxcbiAgICBvbkVudGVyICgpIHtcbiAgICAgIHRoaXMuJGVtaXQoJ3NlbGVjdCcsIHRoaXMuY2hvaXhbdGhpcy5jdXJyZW50U2VsZWN0XSlcbiAgICB9LFxuICAgIGNhbmNlbCAoKSB7XG4gICAgICB0aGlzLiRlbWl0KCdjYW5jZWwnKVxuICAgIH1cbiAgfVxufVxuPC9zY3JpcHQ+XG5cbjxzdHlsZSBzY29wZWQ+XG4gICAgLmZhLWljb24ge1xuICAgICAgbWFyZ2luLWxlZnQ6IDMlO1xuICAgIH1cblxuICAgIC5tb2RhbC1tYXNrIHtcbiAgICAgICAgcG9zaXRpb246IGFic29sdXRlO1xuICAgICAgICB6LWluZGV4OiA5OTtcbiAgICAgICAgdG9wOiAwO1xuICAgICAgICBsZWZ0OiAwO1xuICAgICAgICB3aWR0aDogMzM0cHg7XG4gICAgICAgIGhlaWdodDogNzM4cHg7XG4gICAgICAgIGJhY2tncm91bmQtY29sb3I6IHJnYmEoMCwgMCwgMCwgLjMpO1xuICAgICAgICBkaXNwbGF5OiBmbGV4O1xuICAgICAgICBhbGlnbi1pdGVtczogZmxleC1lbmQ7XG4gICAgICAgIHRyYW5zaXRpb246IG9wYWNpdHkgLjNzIGVhc2U7XG4gICAgfVxuXG4gICAgLm1vZGFsLWNvbnRhaW5lciB7XG4gICAgICB3aWR0aDogMTAwJTtcbiAgICAgIG1hcmdpbjogMDtcbiAgICAgIGJhY2tncm91bmQtY29sb3I6ICNmZmY7XG4gICAgICBib3JkZXItcmFkaXVzOiAycHg7XG4gICAgICBib3gtc2hhZG93OiAwIDJweCA4cHggcmdiYSgwLCAwLCAwLCAuMzMpO1xuICAgICAgdHJhbnNpdGlvbjogYWxsIC4zcyBlYXNlO1xuICAgICAgcGFkZGluZzogMCAwIDE2cHg7XG4gICAgICBtYXgtaGVpZ2h0OiAxMDAlO1xuICAgICAgb3ZlcmZsb3cteTogYXV0bztcbiAgICB9XG5cbiAgICAubW9kYWwtdGl0bGUge1xuICAgICAgICB0ZXh0LWFsaWduOiBjZW50ZXI7XG4gICAgICAgIGhlaWdodDogMzJweDtcbiAgICAgICAgbGluZS1oZWlnaHQ6IDMycHg7XG4gICAgICAgIGNvbG9yOiAjNDJCMkRDO1xuICAgICAgICBib3JkZXItYm90dG9tOiAycHggc29saWQgIzQyQjJEQztcbiAgICB9XG4gICAgLm1vZGFsLWNob2l4IHtcbiAgICAgICAgZm9udC1zaXplOiAxNXB4O1xuICAgICAgICBoZWlnaHQ6IDU2cHg7XG4gICAgICAgIGxpbmUtaGVpZ2h0OiA1NnB4O1xuICAgICAgICBjb2xvcjogZ3JheTtcbiAgICAgICAgcG9zaXRpb246IHJlbGF0aXZlO1xuICAgICAgICBmb250LXdlaWdodDogNDAwO1xuICAgIH1cbiAgICAubW9kYWwtY2hvaXggLmZhLCAubW9kYWwtY2hvaXggLmZhcyB7XG4gICAgICAgIGZvbnQtc2l6ZTogMThweDtcbiAgICAgICAgbGluZS1oZWlnaHQ6IDI0cHg7XG4gICAgICAgIG1hcmdpbi1sZWZ0OiAxMnB4O1xuICAgICAgICBtYXJnaW4tcmlnaHQ6IDEycHg7XG4gICAgfVxuICAgIC5tb2RhbC1jaG9peCAucGljdG8ge1xuICAgICAgICB6LWluZGV4OiA1MDA7XG4gICAgICAgIHBvc2l0aW9uOiBhYnNvbHV0ZTtcbiAgICAgICAgd2lkdGg6IDQycHg7XG4gICAgICAgIGJhY2tncm91bmQtc2l6ZTogMTAwJSAhaW1wb3J0YW50O1xuICAgICAgICBiYWNrZ3JvdW5kLXBvc2l0aW9uLXk6IDEwMCU7XG4gICAgICAgIGhlaWdodDogNDJweDtcbiAgICB9XG4gICAgLm1vZGFsLWNob2l4LnNlbGVjdCwgLm1vZGFsLWNob2l4OmhvdmVyIHtcbiAgICAgIGJhY2tncm91bmQtY29sb3I6ICNFM0UzRTM7XG4gICAgICBjb2xvcjogIzAwNzlkM1xuICAgIH1cblxuXG5cbjwvc3R5bGU+XG4iLCJpbXBvcnQgbW9kIGZyb20gXCItIS4uLy4uLy4uL25vZGVfbW9kdWxlcy9iYWJlbC1sb2FkZXIvbGliL2luZGV4LmpzIS4uLy4uLy4uL25vZGVfbW9kdWxlcy92dWUtbG9hZGVyL2xpYi9pbmRleC5qcz8/dnVlLWxvYWRlci1vcHRpb25zIS4vTW9kYWwudnVlP3Z1ZSZ0eXBlPXNjcmlwdCZsYW5nPWpzJlwiOyBleHBvcnQgZGVmYXVsdCBtb2Q7IGV4cG9ydCAqIGZyb20gXCItIS4uLy4uLy4uL25vZGVfbW9kdWxlcy9iYWJlbC1sb2FkZXIvbGliL2luZGV4LmpzIS4uLy4uLy4uL25vZGVfbW9kdWxlcy92dWUtbG9hZGVyL2xpYi9pbmRleC5qcz8/dnVlLWxvYWRlci1vcHRpb25zIS4vTW9kYWwudnVlP3Z1ZSZ0eXBlPXNjcmlwdCZsYW5nPWpzJlwiIiwiaW1wb3J0IHsgcmVuZGVyLCBzdGF0aWNSZW5kZXJGbnMgfSBmcm9tIFwiLi9Nb2RhbC52dWU/dnVlJnR5cGU9dGVtcGxhdGUmaWQ9MjliNDMyN2Imc2NvcGVkPXRydWUmXCJcbmltcG9ydCBzY3JpcHQgZnJvbSBcIi4vTW9kYWwudnVlP3Z1ZSZ0eXBlPXNjcmlwdCZsYW5nPWpzJlwiXG5leHBvcnQgKiBmcm9tIFwiLi9Nb2RhbC52dWU/dnVlJnR5cGU9c2NyaXB0Jmxhbmc9anMmXCJcbmltcG9ydCBzdHlsZTAgZnJvbSBcIi4vTW9kYWwudnVlP3Z1ZSZ0eXBlPXN0eWxlJmluZGV4PTAmaWQ9MjliNDMyN2Imc2NvcGVkPXRydWUmbGFuZz1jc3MmXCJcblxuXG4vKiBub3JtYWxpemUgY29tcG9uZW50ICovXG5pbXBvcnQgbm9ybWFsaXplciBmcm9tIFwiIS4uLy4uLy4uL25vZGVfbW9kdWxlcy92dWUtbG9hZGVyL2xpYi9ydW50aW1lL2NvbXBvbmVudE5vcm1hbGl6ZXIuanNcIlxudmFyIGNvbXBvbmVudCA9IG5vcm1hbGl6ZXIoXG4gIHNjcmlwdCxcbiAgcmVuZGVyLFxuICBzdGF0aWNSZW5kZXJGbnMsXG4gIGZhbHNlLFxuICBudWxsLFxuICBcIjI5YjQzMjdiXCIsXG4gIG51bGxcbiAgXG4pXG5cbmV4cG9ydCBkZWZhdWx0IGNvbXBvbmVudC5leHBvcnRzIiwidmFyIHJlbmRlciA9IGZ1bmN0aW9uICgpIHt2YXIgX3ZtPXRoaXM7dmFyIF9oPV92bS4kY3JlYXRlRWxlbWVudDt2YXIgX2M9X3ZtLl9zZWxmLl9jfHxfaDtyZXR1cm4gX2MoJ3RyYW5zaXRpb24nLHthdHRyczp7XCJuYW1lXCI6XCJtb2RhbFwifX0sW19jKCdkaXYnLHtzdGF0aWNDbGFzczpcIm1vZGFsLW1hc2tcIn0sW19jKCdkaXYnLHtzdGF0aWNDbGFzczpcIm1vZGFsLWNvbnRhaW5lclwiLG9uOntcImNsaWNrXCI6ZnVuY3Rpb24oJGV2ZW50KXskZXZlbnQuc3RvcFByb3BhZ2F0aW9uKCk7fX19LFtfYygnaDInLHtzdHlsZTooe2NvbG9yOiBfdm0uY29sb3J9KX0sW192bS5fdihcIlxcbiAgICAgICAgXCIrX3ZtLl9zKF92bS50aXRsZSkrXCJcXG4gICAgICBcIildKSxfdm0uX3YoXCIgXCIpLF9jKCd0ZXh0YXJlYScse2RpcmVjdGl2ZXM6W3tuYW1lOlwibW9kZWxcIixyYXdOYW1lOlwidi1tb2RlbFwiLHZhbHVlOihfdm0uaW5wdXRUZXh0KSxleHByZXNzaW9uOlwiaW5wdXRUZXh0XCJ9XSxyZWY6XCJ0ZXh0YXJlYVwiLHN0YXRpY0NsYXNzOlwibW9kYWwtdGV4dGFyZWFcIixjbGFzczp7b25lbGluZTogX3ZtLmxpbWl0IDw9IDE4fSxzdHlsZTooe2JvcmRlckNvbG9yOiBfdm0uY29sb3J9KSxhdHRyczp7XCJtYXhsZW5ndGhcIjpfdm0ubGltaXR9LGRvbVByb3BzOntcInZhbHVlXCI6KF92bS5pbnB1dFRleHQpfSxvbjp7XCJpbnB1dFwiOmZ1bmN0aW9uKCRldmVudCl7aWYoJGV2ZW50LnRhcmdldC5jb21wb3NpbmcpeyByZXR1cm47IH1fdm0uaW5wdXRUZXh0PSRldmVudC50YXJnZXQudmFsdWV9fX0pLF92bS5fdihcIiBcIiksX2MoJ2Rpdicse3N0YXRpY0NsYXNzOlwiYm90dG9uLWNvbnRhaW5lclwifSxbX2MoJ2J1dHRvbicse3N0eWxlOih7Y29sb3I6IF92bS5jb2xvcn0pLG9uOntcImNsaWNrXCI6X3ZtLmNhbmNlbH19LFtfdm0uX3YoXCJcXG4gICAgICAgICAgXCIrX3ZtLl9zKF92bS5JbnRsU3RyaW5nKCdDQU5DRUwnKSkrXCJcXG4gICAgICAgIFwiKV0pLF92bS5fdihcIiBcIiksX2MoJ2J1dHRvbicse3N0eWxlOih7Y29sb3I6IF92bS5jb2xvcn0pLG9uOntcImNsaWNrXCI6X3ZtLnZhbGlkZX19LFtfdm0uX3YoXCJcXG4gICAgICAgICAgXCIrX3ZtLl9zKF92bS5JbnRsU3RyaW5nKCdPSycpKStcIlxcbiAgICAgICAgXCIpXSldKV0pXSldKX1cbnZhciBzdGF0aWNSZW5kZXJGbnMgPSBbXVxuXG5leHBvcnQgeyByZW5kZXIsIHN0YXRpY1JlbmRlckZucyB9IiwiPHRlbXBsYXRlPlxuICA8dHJhbnNpdGlvbiBuYW1lPVwibW9kYWxcIj5cbiAgICA8ZGl2XG4gICAgICBjbGFzcz1cIm1vZGFsLW1hc2tcIlxuICAgID5cbiAgICAgIDxkaXZcbiAgICAgICAgY2xhc3M9XCJtb2RhbC1jb250YWluZXJcIlxuICAgICAgICBAY2xpY2suc3RvcFxuICAgICAgPlxuICAgICAgICA8aDIgOnN0eWxlPVwie2NvbG9yfVwiPlxuICAgICAgICAgIHt7IHRpdGxlIH19XG4gICAgICAgIDwvaDI+XG4gICAgICAgIDx0ZXh0YXJlYVxuICAgICAgICAgIHJlZj1cInRleHRhcmVhXCJcbiAgICAgICAgICB2LW1vZGVsPVwiaW5wdXRUZXh0XCJcbiAgICAgICAgICBjbGFzcz1cIm1vZGFsLXRleHRhcmVhXCJcbiAgICAgICAgICA6Y2xhc3M9XCJ7b25lbGluZTogbGltaXQgPD0gMTh9XCJcbiAgICAgICAgICA6c3R5bGU9XCJ7Ym9yZGVyQ29sb3I6IGNvbG9yfVwiXG4gICAgICAgICAgOm1heGxlbmd0aD1cImxpbWl0XCJcbiAgICAgICAgLz5cbiAgICAgICAgPGRpdiBjbGFzcz1cImJvdHRvbi1jb250YWluZXJcIj5cbiAgICAgICAgICA8YnV0dG9uXG4gICAgICAgICAgICA6c3R5bGU9XCJ7Y29sb3J9XCJcbiAgICAgICAgICAgIEBjbGljaz1cImNhbmNlbFwiXG4gICAgICAgICAgPlxuICAgICAgICAgICAge3sgSW50bFN0cmluZygnQ0FOQ0VMJykgfX1cbiAgICAgICAgICA8L2J1dHRvbj5cbiAgICAgICAgICA8YnV0dG9uXG4gICAgICAgICAgICA6c3R5bGU9XCJ7Y29sb3J9XCJcbiAgICAgICAgICAgIEBjbGljaz1cInZhbGlkZVwiXG4gICAgICAgICAgPlxuICAgICAgICAgICAge3sgSW50bFN0cmluZygnT0snKSB9fVxuICAgICAgICAgIDwvYnV0dG9uPlxuICAgICAgICA8L2Rpdj5cbiAgICAgIDwvZGl2PlxuICAgIDwvZGl2PlxuICA8L3RyYW5zaXRpb24+XG48L3RlbXBsYXRlPlxuXG48c2NyaXB0PlxuaW1wb3J0IHN0b3JlIGZyb20gJy4vLi4vLi4vc3RvcmUnXG5pbXBvcnQge21hcEdldHRlcnN9IGZyb20gJ3Z1ZXgnXG5cbmV4cG9ydCBkZWZhdWx0IHtcbiAgbmFtZTogJ1RleHRNb2RhbCcsXG4gIHN0b3JlOiBzdG9yZSxcbiAgcHJvcHM6IHtcbiAgICB0aXRsZToge1xuICAgICAgdHlwZTogU3RyaW5nLFxuICAgICAgZGVmYXVsdDogKCkgPT4gJydcbiAgICB9LFxuICAgIHRleHQ6IHtcbiAgICAgIHR5cGU6IFN0cmluZyxcbiAgICAgIGRlZmF1bHQ6ICgpID0+ICcnXG4gICAgfSxcbiAgICBsaW1pdDoge1xuICAgICAgdHlwZTogTnVtYmVyLFxuICAgICAgZGVmYXVsdDogMjU1XG4gICAgfVxuICB9LFxuICBkYXRhKCkge1xuICAgIHJldHVybiB7XG4gICAgICBpbnB1dFRleHQ6ICcnXG4gICAgfVxuICB9LFxuICBjb21wdXRlZDoge1xuICAgIC4uLm1hcEdldHRlcnMoWydJbnRsU3RyaW5nJywgJ3RoZW1lQ29sb3InXSksXG4gICAgY29sb3IoKSB7XG4gICAgICByZXR1cm4gdGhpcy50aGVtZUNvbG9yIHx8ICcjMkE1NkM2J1xuICAgIH1cbiAgfSxcbiAgY3JlYXRlZCgpIHtcbiAgICB0aGlzLmlucHV0VGV4dCA9IHRoaXMudGV4dFxuICB9LFxuICBtb3VudGVkKCkge1xuICAgIHRoaXMuJG5leHRUaWNrKCgpID0+IHtcbiAgICAgIHRoaXMuJHJlZnMudGV4dGFyZWEuZm9jdXMoKVxuICAgIH0pXG4gIH0sXG4gIGJlZm9yZURlc3Ryb3koKSB7XG4gIH0sXG4gIG1ldGhvZHM6IHtcbiAgICBzY3JvbGxJbnRvVmlld0lmTmVlZGVkKCkge1xuICAgICAgdGhpcy4kbmV4dFRpY2soKCkgPT4ge1xuICAgICAgICBkb2N1bWVudC5xdWVyeVNlbGVjdG9yKCcubW9kYWwtY2hvaXguc2VsZWN0Jykuc2Nyb2xsSW50b1ZpZXdJZk5lZWRlZCgpXG4gICAgICB9KVxuICAgIH0sXG4gICAgb25VcCgpIHtcbiAgICAgIHRoaXMuY3VycmVudFNlbGVjdCA9IHRoaXMuY3VycmVudFNlbGVjdCA9PT0gMCA/IDAgOiB0aGlzLmN1cnJlbnRTZWxlY3QgLSAxXG4gICAgICB0aGlzLnNjcm9sbEludG9WaWV3SWZOZWVkZWQoKVxuICAgIH0sXG4gICAgb25Eb3duKCkge1xuICAgICAgdGhpcy5jdXJyZW50U2VsZWN0ID0gdGhpcy5jdXJyZW50U2VsZWN0ID09PSB0aGlzLmNob2l4Lmxlbmd0aCAtIDEgPyB0aGlzLmN1cnJlbnRTZWxlY3QgOiB0aGlzLmN1cnJlbnRTZWxlY3QgKyAxXG4gICAgICB0aGlzLnNjcm9sbEludG9WaWV3SWZOZWVkZWQoKVxuICAgIH0sXG4gICAgc2VsZWN0SXRlbShlbGVtKSB7XG4gICAgICB0aGlzLiRlbWl0KCdzZWxlY3QnLCBlbGVtKVxuICAgIH0sXG4gICAgb25FbnRlcigpIHtcbiAgICAgIHRoaXMuJGVtaXQoJ3NlbGVjdCcsIHRoaXMuY2hvaXhbdGhpcy5jdXJyZW50U2VsZWN0XSlcbiAgICB9LFxuICAgIGNhbmNlbCgpIHtcbiAgICAgIHRoaXMuJGVtaXQoJ2NhbmNlbCcpXG4gICAgfSxcbiAgICB2YWxpZGUoKSB7XG4gICAgICB0aGlzLiRlbWl0KCd2YWxpZCcsIHtcbiAgICAgICAgdGV4dDogdGhpcy5pbnB1dFRleHRcbiAgICAgIH0pXG4gICAgfVxuICB9XG59XG48L3NjcmlwdD5cblxuPHN0eWxlIHNjb3BlZD5cbi5tb2RhbC1tYXNrIHtcbiAgcG9zaXRpb246IGFic29sdXRlO1xuICB6LWluZGV4OiA5OTtcbiAgdG9wOiAwO1xuICBsZWZ0OiAwO1xuICB3aWR0aDogMTAwJTtcbiAgaGVpZ2h0OiAxMDAlO1xuICBiYWNrZ3JvdW5kLWNvbG9yOiByZ2JhKDAsIDAsIDAsIC4zKTtcbiAgZGlzcGxheTogZmxleDtcbiAgYWxpZ24taXRlbXM6IGNlbnRlcjtcbiAganVzdGlmeS1jb250ZW50OiBjZW50ZXI7XG4gIHRyYW5zaXRpb246IG9wYWNpdHkgLjNzIGVhc2U7XG59XG5cbi5tb2RhbC1jb250YWluZXIge1xuICBtYXJnaW46IDA7XG4gIGJhY2tncm91bmQtY29sb3I6ICNmZmY7XG4gIGJvcmRlci1yYWRpdXM6IDJweDtcbiAgYm94LXNoYWRvdzogMCAycHggOHB4IHJnYmEoMCwgMCwgMCwgLjMzKTtcbiAgdHJhbnNpdGlvbjogYWxsIC4zcyBlYXNlO1xuICBtYXgtaGVpZ2h0OiAxMDAlO1xuICB3aWR0aDogOTAlO1xuICBvdmVyZmxvdy15OiBhdXRvO1xuICBwYWRkaW5nOiAxNXB4IDIwcHg7XG4gIGZvbnQtc2l6ZTogMThweDtcbn1cblxuaDIge1xuICBmb250LXNpemU6IDIycHg7XG59XG5cbi5tb2RhbC10ZXh0YXJlYSB7XG4gIHdpZHRoOiAxMDAlO1xuICBoZWlnaHQ6IDE0MHB4O1xuICBib3JkZXI6IG5vbmU7XG4gIHJlc2l6ZTogbm9uZTtcbiAgYm9yZGVyLWJvdHRvbTogM3B4IHNvbGlkIHJlZDtcbiAgb3V0bGluZTogbm9uZTtcbiAgZm9udC1zaXplOiAxOHB4O1xufVxuXG4ubW9kYWwtdGV4dGFyZWEub25lbGluZSB7XG4gIGhlaWdodDogMzhweDtcbn1cblxuXG4uYm90dG9uLWNvbnRhaW5lciB7XG4gIG1hcmdpbi10b3A6IDEycHg7XG4gIGRpc3BsYXk6IGZsZXg7XG4gIGp1c3RpZnktY29udGVudDogZmxleC1lbmQ7XG59XG5cbi5ib3R0b24tY29udGFpbmVyIGJ1dHRvbiB7XG4gIGJhY2tncm91bmQtY29sb3I6IHRyYW5zcGFyZW50O1xuICBib3JkZXI6IG5vbmU7XG4gIGZvbnQtc2l6ZTogMThweDtcbiAgZm9udC13ZWlnaHQ6IDcwMDtcbiAgcGFkZGluZzogNnB4IDEycHg7XG4gIG91dGxpbmU6IG5vbmU7XG59XG5cbi5ib3R0b24tY29udGFpbmVyIGJ1dHRvbjpob3ZlciB7XG4gIGJhY2tncm91bmQtY29sb3I6IHJnYmEoMCwgMCwgMCwgLjEpO1xufVxuXG48L3N0eWxlPlxuIiwiaW1wb3J0IG1vZCBmcm9tIFwiLSEuLi8uLi8uLi9ub2RlX21vZHVsZXMvYmFiZWwtbG9hZGVyL2xpYi9pbmRleC5qcyEuLi8uLi8uLi9ub2RlX21vZHVsZXMvdnVlLWxvYWRlci9saWIvaW5kZXguanM/P3Z1ZS1sb2FkZXItb3B0aW9ucyEuL1RleHRNb2RhbC52dWU/dnVlJnR5cGU9c2NyaXB0Jmxhbmc9anMmXCI7IGV4cG9ydCBkZWZhdWx0IG1vZDsgZXhwb3J0ICogZnJvbSBcIi0hLi4vLi4vLi4vbm9kZV9tb2R1bGVzL2JhYmVsLWxvYWRlci9saWIvaW5kZXguanMhLi4vLi4vLi4vbm9kZV9tb2R1bGVzL3Z1ZS1sb2FkZXIvbGliL2luZGV4LmpzPz92dWUtbG9hZGVyLW9wdGlvbnMhLi9UZXh0TW9kYWwudnVlP3Z1ZSZ0eXBlPXNjcmlwdCZsYW5nPWpzJlwiIiwiaW1wb3J0IHsgcmVuZGVyLCBzdGF0aWNSZW5kZXJGbnMgfSBmcm9tIFwiLi9UZXh0TW9kYWwudnVlP3Z1ZSZ0eXBlPXRlbXBsYXRlJmlkPTExMmQwNDk3JnNjb3BlZD10cnVlJlwiXG5pbXBvcnQgc2NyaXB0IGZyb20gXCIuL1RleHRNb2RhbC52dWU/dnVlJnR5cGU9c2NyaXB0Jmxhbmc9anMmXCJcbmV4cG9ydCAqIGZyb20gXCIuL1RleHRNb2RhbC52dWU/dnVlJnR5cGU9c2NyaXB0Jmxhbmc9anMmXCJcbmltcG9ydCBzdHlsZTAgZnJvbSBcIi4vVGV4dE1vZGFsLnZ1ZT92dWUmdHlwZT1zdHlsZSZpbmRleD0wJmlkPTExMmQwNDk3JnNjb3BlZD10cnVlJmxhbmc9Y3NzJlwiXG5cblxuLyogbm9ybWFsaXplIGNvbXBvbmVudCAqL1xuaW1wb3J0IG5vcm1hbGl6ZXIgZnJvbSBcIiEuLi8uLi8uLi9ub2RlX21vZHVsZXMvdnVlLWxvYWRlci9saWIvcnVudGltZS9jb21wb25lbnROb3JtYWxpemVyLmpzXCJcbnZhciBjb21wb25lbnQgPSBub3JtYWxpemVyKFxuICBzY3JpcHQsXG4gIHJlbmRlcixcbiAgc3RhdGljUmVuZGVyRm5zLFxuICBmYWxzZSxcbiAgbnVsbCxcbiAgXCIxMTJkMDQ5N1wiLFxuICBudWxsXG4gIFxuKVxuXG5leHBvcnQgZGVmYXVsdCBjb21wb25lbnQuZXhwb3J0cyIsImltcG9ydCBWdWUgZnJvbSAndnVlJ1xuaW1wb3J0IE1vZGFsIGZyb20gJy4vTW9kYWwnXG5pbXBvcnQgVGV4dE1vZGFsIGZyb20gJy4vVGV4dE1vZGFsJ1xuaW1wb3J0IHN0b3JlIGZyb20gJ0Avc3RvcmUnXG5pbXBvcnQgUGhvbmVBUEkgZnJvbSAnQC9QaG9uZUFQSSdcblxuZXhwb3J0IGRlZmF1bHQge1xuICBDcmVhdGVNb2RhbCAocHJvcHNEYXRhID0ge30pIHtcbiAgICByZXR1cm4gbmV3IFByb21pc2UoKHJlc29sdmUpID0+IHtcbiAgICAgIGxldCBtb2RhbCA9IG5ldyAoVnVlLmV4dGVuZChNb2RhbCkpKHtcbiAgICAgICAgZWw6IGRvY3VtZW50LmNyZWF0ZUVsZW1lbnQoJ2RpdicpLFxuICAgICAgICBwcm9wc0RhdGFcbiAgICAgIH0pXG4gICAgICBkb2N1bWVudC5xdWVyeVNlbGVjdG9yKCcjYXBwJykuYXBwZW5kQ2hpbGQobW9kYWwuJGVsKVxuICAgICAgbW9kYWwuJG9uKCdzZWxlY3QnLCAoZGF0YSkgPT4ge1xuICAgICAgICByZXNvbHZlKGRhdGEpXG4gICAgICAgIG1vZGFsLiRlbC5wYXJlbnROb2RlLnJlbW92ZUNoaWxkKG1vZGFsLiRlbClcbiAgICAgICAgbW9kYWwuJGRlc3Ryb3koKVxuICAgICAgfSlcbiAgICAgIG1vZGFsLiRvbignY2FuY2VsJywgKCkgPT4ge1xuICAgICAgICByZXNvbHZlKHt0aXRsZTogJ2NhbmNlbCd9KVxuICAgICAgICBtb2RhbC4kZWwucGFyZW50Tm9kZS5yZW1vdmVDaGlsZChtb2RhbC4kZWwpXG4gICAgICAgIG1vZGFsLiRkZXN0cm95KClcbiAgICAgIH0pXG4gICAgfSlcbiAgfSxcbiAgQ3JlYXRlVGV4dE1vZGFsIChwcm9wc0RhdGEgPSB7fSkge1xuICAgIGlmIChzdG9yZS5nZXR0ZXJzLnVzZU1vdXNlID09PSBmYWxzZSkge1xuICAgICAgcmV0dXJuIFBob25lQVBJLmdldFJlcG9uc2VUZXh0KHByb3BzRGF0YSlcbiAgICB9XG4gICAgcmV0dXJuIG5ldyBQcm9taXNlKChyZXNvbHZlLCByZWplY3QpID0+IHtcbiAgICAgIGxldCBtb2RhbCA9IG5ldyAoVnVlLmV4dGVuZChUZXh0TW9kYWwpKSh7XG4gICAgICAgIGVsOiBkb2N1bWVudC5jcmVhdGVFbGVtZW50KCdkaXYnKSxcbiAgICAgICAgcHJvcHNEYXRhXG4gICAgICB9KVxuICAgICAgZG9jdW1lbnQucXVlcnlTZWxlY3RvcignI2FwcCcpLmFwcGVuZENoaWxkKG1vZGFsLiRlbClcbiAgICAgIG1vZGFsLiRvbigndmFsaWQnLCAoZGF0YSkgPT4ge1xuICAgICAgICByZXNvbHZlKGRhdGEpXG4gICAgICAgIG1vZGFsLiRlbC5wYXJlbnROb2RlLnJlbW92ZUNoaWxkKG1vZGFsLiRlbClcbiAgICAgICAgbW9kYWwuJGRlc3Ryb3koKVxuICAgICAgfSlcbiAgICAgIG1vZGFsLiRvbignY2FuY2VsJywgKCkgPT4ge1xuICAgICAgICByZWplY3QoJ1VzZXJDYW5jZWwnKVxuICAgICAgICBtb2RhbC4kZWwucGFyZW50Tm9kZS5yZW1vdmVDaGlsZChtb2RhbC4kZWwpXG4gICAgICAgIG1vZGFsLiRkZXN0cm95KClcbiAgICAgIH0pXG4gICAgfSkuY2F0Y2goKCkgPT4gdGhpcy4kcGhvbmVBUEkubG9nKCdVc2VyQ2FuY2VsJykpXG4gIH1cbn1cbiJdLCJzb3VyY2VSb290IjoiIn0=\n//# sourceURL=webpack-internal:///4410\n")}}]);