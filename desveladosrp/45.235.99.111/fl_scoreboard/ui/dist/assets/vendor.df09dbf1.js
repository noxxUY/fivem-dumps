function d(){}function nt(t,n){for(const e in n)t[e]=n[e];return t}function C(t){return t()}function q(){return Object.create(null)}function p(t){t.forEach(C)}function H(t){return typeof t=="function"}function F(t,n){return t!=t?n==n:t!==n||t&&typeof t=="object"||typeof t=="function"}let x;function et(t,n){return x||(x=document.createElement("a")),x.href=n,t===x.href}function L(t){return Object.keys(t).length===0}function S(t,...n){if(t==null)return d;const e=t.subscribe(...n);return e.unsubscribe?()=>e.unsubscribe():e}function st(t){let n;return S(t,e=>n=e)(),n}function rt(t,n,e){t.$$.on_destroy.push(S(n,e))}function it(t,n){t.appendChild(n)}function P(t,n,e){t.insertBefore(n,e||null)}function M(t){t.parentNode.removeChild(t)}function ot(t,n){for(let e=0;e<t.length;e+=1)t[e]&&t[e].d(n)}function D(t){return document.createElement(t)}function G(t){return document.createElementNS("http://www.w3.org/2000/svg",t)}function I(t){return document.createTextNode(t)}function ut(){return I(" ")}function ct(t,n,e){e==null?t.removeAttribute(n):t.getAttribute(n)!==e&&t.setAttribute(n,e)}function J(t){return Array.from(t.childNodes)}function ft(t,n){n=""+n,t.wholeText!==n&&(t.data=n)}class at{constructor(n=!1){this.is_svg=!1,this.is_svg=n,this.e=this.n=null}c(n){this.h(n)}m(n,e,r=null){this.e||(this.is_svg?this.e=G(e.nodeName):this.e=D(e.nodeName),this.t=e,this.c(n)),this.i(r)}h(n){this.e.innerHTML=n,this.n=Array.from(this.e.childNodes)}i(n){for(let e=0;e<this.n.length;e+=1)P(this.t,this.n[e],n)}p(n){this.d(),this.h(n),this.i(this.a)}d(){this.n.forEach(M)}}let $;function y(t){$=t}function K(){if(!$)throw new Error("Function called outside component initialization");return $}function lt(t){K().$$.on_mount.push(t)}const b=[],z=[],E=[],T=[],Q=Promise.resolve();let j=!1;function R(){j||(j=!0,Q.then(O))}function N(t){E.push(t)}const A=new Set;let k=0;function O(){const t=$;do{for(;k<b.length;){const n=b[k];k++,y(n),U(n.$$)}for(y(null),b.length=0,k=0;z.length;)z.pop()();for(let n=0;n<E.length;n+=1){const e=E[n];A.has(e)||(A.add(e),e())}E.length=0}while(b.length);for(;T.length;)T.pop()();j=!1,A.clear(),y(t)}function U(t){if(t.fragment!==null){t.update(),p(t.before_update);const n=t.dirty;t.dirty=[-1],t.fragment&&t.fragment.p(t.ctx,n),t.after_update.forEach(N)}}const v=new Set;let h;function dt(){h={r:0,c:[],p:h}}function ht(){h.r||p(h.c),h=h.p}function V(t,n){t&&t.i&&(v.delete(t),t.i(n))}function _t(t,n,e,r){if(t&&t.o){if(v.has(t))return;v.add(t),h.c.push(()=>{v.delete(t),r&&(e&&t.d(1),r())}),t.o(n)}else r&&r()}function gt(t,n){const e={},r={},u={$$scope:1};let f=t.length;for(;f--;){const c=t[f],o=n[f];if(o){for(const i in c)i in o||(r[i]=1);for(const i in o)u[i]||(e[i]=o[i],u[i]=1);t[f]=o}else for(const i in c)u[i]=1}for(const c in r)c in e||(e[c]=void 0);return e}function mt(t){return typeof t=="object"&&t!==null?t:{}}function pt(t){t&&t.c()}function W(t,n,e,r){const{fragment:u,on_mount:f,on_destroy:c,after_update:o}=t.$$;u&&u.m(n,e),r||N(()=>{const i=f.map(C).filter(H);c?c.push(...i):p(i),t.$$.on_mount=[]}),o.forEach(N)}function X(t,n){const e=t.$$;e.fragment!==null&&(p(e.on_destroy),e.fragment&&e.fragment.d(n),e.on_destroy=e.fragment=null,e.ctx=[])}function Y(t,n){t.$$.dirty[0]===-1&&(b.push(t),R(),t.$$.dirty.fill(0)),t.$$.dirty[n/31|0]|=1<<n%31}function bt(t,n,e,r,u,f,c,o=[-1]){const i=$;y(t);const s=t.$$={fragment:null,ctx:null,props:f,update:d,not_equal:u,bound:q(),on_mount:[],on_destroy:[],on_disconnect:[],before_update:[],after_update:[],context:new Map(n.context||(i?i.$$.context:[])),callbacks:q(),dirty:o,skip_bound:!1,root:n.target||i.$$.root};c&&c(s.root);let _=!1;if(s.ctx=e?e(t,n.props||{},(a,w,...l)=>{const g=l.length?l[0]:w;return s.ctx&&u(s.ctx[a],s.ctx[a]=g)&&(!s.skip_bound&&s.bound[a]&&s.bound[a](g),_&&Y(t,a)),w}):[],s.update(),_=!0,p(s.before_update),s.fragment=r?r(s.ctx):!1,n.target){if(n.hydrate){const a=J(n.target);s.fragment&&s.fragment.l(a),a.forEach(M)}else s.fragment&&s.fragment.c();n.intro&&V(t.$$.fragment),W(t,n.target,n.anchor,n.customElement),O()}y(i)}class yt{$destroy(){X(this,1),this.$destroy=d}$on(n,e){const r=this.$$.callbacks[n]||(this.$$.callbacks[n]=[]);return r.push(e),()=>{const u=r.indexOf(e);u!==-1&&r.splice(u,1)}}$set(n){this.$$set&&!L(n)&&(this.$$.skip_bound=!0,this.$$set(n),this.$$.skip_bound=!1)}}const m=[];function Z(t,n){return{subscribe:tt(t,n).subscribe}}function tt(t,n=d){let e;const r=new Set;function u(o){if(F(t,o)&&(t=o,e)){const i=!m.length;for(const s of r)s[1](),m.push(s,t);if(i){for(let s=0;s<m.length;s+=2)m[s][0](m[s+1]);m.length=0}}}function f(o){u(o(t))}function c(o,i=d){const s=[o,i];return r.add(s),r.size===1&&(e=n(u)||d),o(t),()=>{r.delete(s),r.size===0&&(e(),e=null)}}return{set:u,update:f,subscribe:c}}function $t(t,n,e){const r=!Array.isArray(t),u=r?[t]:t,f=n.length<2;return Z(e,c=>{let o=!1;const i=[];let s=0,_=d;const a=()=>{if(s)return;_();const l=n(r?i[0]:i,c);f?c(l):_=H(l)?l:d},w=u.map((l,g)=>S(l,B=>{i[g]=B,s&=~(1<<g),o&&a()},()=>{s|=1<<g}));return o=!0,a(),function(){p(w),_()}})}export{lt as A,dt as B,at as H,yt as S,ct as a,P as b,M as c,$t as d,D as e,ut as f,st as g,it as h,bt as i,ft as j,nt as k,pt as l,et as m,d as n,W as o,gt as p,mt as q,V as r,F as s,I as t,_t as u,ot as v,tt as w,X as x,rt as y,ht as z};
