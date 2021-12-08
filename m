Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0871346D042
	for <lists+linux-cachefs@lfdr.de>; Wed,  8 Dec 2021 10:40:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638956449;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0yo0Hicg4gqI3vhea6d5LY/4THp7MUxu4cGHf1jtres=;
	b=G/ZV6CuE8UhXqu0ybSdwRZ18EnWlW8yM42QjpVcX9WcHzSc+6SwXx8XJhPCXDTIkpMUfGY
	37iJvq05jR8cHZfB7JbAvTNa0++mnl/yCW9czZartFACmI5+xMVJvOikLQOjw+1JS4321T
	Yl6B55MmnJBlWtUUCtDEU6VlQV4uq+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-LCp_G9wVMFiHRKj1b6WRog-1; Wed, 08 Dec 2021 04:40:46 -0500
X-MC-Unique: LCp_G9wVMFiHRKj1b6WRog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4AFA61268;
	Wed,  8 Dec 2021 09:40:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACEFE17CD9;
	Wed,  8 Dec 2021 09:40:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B72A41809CB8;
	Wed,  8 Dec 2021 09:40:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B89eYtd008994 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 8 Dec 2021 04:40:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0292D45D74; Wed,  8 Dec 2021 09:40:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5920F45D72;
	Wed,  8 Dec 2021 09:40:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20211206172340.fded3873aed7e853b54ab276@linux-foundation.org>
References: <20211206172340.fded3873aed7e853b54ab276@linux-foundation.org>
	<1638760762-27239-1-git-send-email-huangzhaoyang@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
MIME-Version: 1.0
Date: Wed, 08 Dec 2021 09:40:12 +0000
Message-ID: <2502103.1638956412@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1B89eYtd008994
X-loop: linux-cachefs@redhat.com
Cc: Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Huangzhaoyang <huangzhaoyang@gmail.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH] mm: mask DIRECT_RECLAIM in kswapd
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2502102.1638956412.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Andrew Morton <akpm@linux-foundation.org> wrote:

> >       __fscache_maybe_release_page
> > 	...
> >          if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS)) {
> >                  fscache_stat(&fscache_n_store_vmscan_busy);
> >                  return false;
> >          }
> 
> Well, we have thus far been permitting kswapd's memory allocations to
> enter direct reclaim.  Forbidding that kernel-wide might be the right
> thing to do, or might not be.  But disabling it kernel-wide because of
> a peculiar hack in fscache is not good justification.

It's avoiding sleeping in ->releasepage() if fscache is doing something with
the page.  With the old I/O still used by nfs and cifs, PG_fscache means that
the page is known to fscache and it might be doing something with it in the
background.  You have to ask fscache to release the page, which may require
I/O to take place, to get rid of the mark.

With the new I/O, as used by 9p, afs and ceph, where we're doing async DIO
between the page and the cache, PG_fscache just means that there's a DIO write
in progress from the page.  It will be cleared when the DIO completes.

I'm fine with changing the condition in the if-statement.  Note that in my
fscache-rewrite branch:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-rewrite

I've been changing this to:

	if (!gfpflags_allow_blocking(gfp) || !(gfp & __GFP_FS))

and the old I/O is gone.  This is aimed at the next merge window.  If you want
me to change it there, let me know.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

