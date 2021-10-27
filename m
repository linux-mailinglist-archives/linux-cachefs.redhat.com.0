Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A20EC43CDA0
	for <lists+linux-cachefs@lfdr.de>; Wed, 27 Oct 2021 17:34:12 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-OkFGar6OM32bxr7u7LUExg-1; Wed, 27 Oct 2021 11:34:06 -0400
X-MC-Unique: OkFGar6OM32bxr7u7LUExg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B29219200C1;
	Wed, 27 Oct 2021 15:34:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 939D2104253D;
	Wed, 27 Oct 2021 15:34:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFC764EA2A;
	Wed, 27 Oct 2021 15:33:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19RFGdJL007188 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 11:16:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5BBAD2026D2D; Wed, 27 Oct 2021 15:16:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 570D92026D48
	for <linux-cachefs@redhat.com>; Wed, 27 Oct 2021 15:16:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 829C1185A79C
	for <linux-cachefs@redhat.com>; Wed, 27 Oct 2021 15:16:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-166-eOPcnNMWOSGc63UD3sov2g-1;
	Wed, 27 Oct 2021 11:16:30 -0400
X-MC-Unique: eOPcnNMWOSGc63UD3sov2g-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F7A4610A3;
	Wed, 27 Oct 2021 15:16:29 +0000 (UTC)
Message-ID: <a2f738d08d14417a693c6f0d7f97faff448595ab.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Dongliang Mu <mudongliangabcd@gmail.com>, David Howells
	<dhowells@redhat.com>
Date: Wed, 27 Oct 2021 11:16:28 -0400
In-Reply-To: <20211027150732.4158273-1-mudongliangabcd@gmail.com>
References: <20211027150732.4158273-1-mudongliangabcd@gmail.com>
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] fscache: fix GPF in fscache_free_cookie
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-10-27 at 23:07 +0800, Dongliang Mu wrote:
> If fscache_alloc_cookie encounters memory allocation failure, it will
> go to nomem label and invoke fscache_free_cookie. However,
> fscache_alloc_cookie assumes current cookie is already linked into
> fscache_cookies and directly calls list_del. This assumption does not
> hold since list_add is not called in the above scenario. As a result, it
> will lead to Null Pointer Dereference. The stack trace is in the
> following.
> 
> Call Trace:
>  __list_del_entry include/linux/list.h:132 [inline]
>  list_del include/linux/list.h:146 [inline]
>  fscache_free_cookie fs/fscache/cookie.c:71 [inline]
>  fscache_free_cookie+0x3f/0x100 fs/fscache/cookie.c:66
>  fscache_alloc_cookie+0x2e2/0x300 fs/fscache/cookie.c:195
>  __fscache_acquire_cookie fs/fscache/cookie.c:296 [inline]
>  __fscache_acquire_cookie+0x132/0x380 fs/fscache/cookie.c:257
>  fscache_acquire_cookie include/linux/fscache.h:334 [inline]
>  v9fs_cache_session_get_cookie+0x74/0x120 fs/9p/cache.c:60
>  v9fs_session_init+0x724/0xa90 fs/9p/v9fs.c:471
>  v9fs_mount+0x56/0x450 fs/9p/vfs_super.c:126
>  legacy_get_tree+0x2b/0x90 fs/fs_context.c:610
>  vfs_get_tree+0x28/0x100 fs/super.c:1498
>  do_new_mount fs/namespace.c:2988 [inline]
>  path_mount+0xb92/0xfe0 fs/namespace.c:3318
>  do_mount+0xa1/0xc0 fs/namespace.c:3331
>  __do_sys_mount fs/namespace.c:3539 [inline]
>  __se_sys_mount fs/namespace.c:3516 [inline]
>  __x64_sys_mount+0xf4/0x160 fs/namespace.c:3516
> 
> Fix this by moving the list_add_tail before goto statements.
> 
> Fixes: 884a76881fc5 ("fscache: Procfile to display cookies")
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>  fs/fscache/cookie.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
> index cd42be646ed3..d101e212db74 100644
> --- a/fs/fscache/cookie.c
> +++ b/fs/fscache/cookie.c
> @@ -150,6 +150,11 @@ struct fscache_cookie *fscache_alloc_cookie(
>  	if (!cookie)
>  		return NULL;
>  
> +	/* move list_add_tail before any error handling code */
> +	write_lock(&fscache_cookies_lock);
> +	list_add_tail(&cookie->proc_link, &fscache_cookies);
> +	write_unlock(&fscache_cookies_lock);
> +
>  	cookie->key_len = index_key_len;
>  	cookie->aux_len = aux_data_len;
>  
> @@ -186,9 +191,6 @@ struct fscache_cookie *fscache_alloc_cookie(
>  	 * told it may not wait */
>  	INIT_RADIX_TREE(&cookie->stores, GFP_NOFS & ~__GFP_DIRECT_RECLAIM);
>  
> -	write_lock(&fscache_cookies_lock);
> -	list_add_tail(&cookie->proc_link, &fscache_cookies);
> -	write_unlock(&fscache_cookies_lock);
>  	return cookie;
>  
>  nomem:

Nice catch!

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

