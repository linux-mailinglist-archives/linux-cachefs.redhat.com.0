Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D1EB74228B0
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Oct 2021 15:52:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633441928;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cjkYo+FgXSqURvuN2PbvRtXX8xNWluABr34ia3Td/wQ=;
	b=SJYm3waFjN1HZE/jvYhpcaGUzgEzMd+PS6njiiAqJE9ZKb4z/RVVtopQxrCjm7869ur67O
	aOnjaHi1eR7l9+o8eZ1yZ2ZpGbcBnltE4dDHsL7cvyXUbB5PjqEERzHEi+KpOprkd30obz
	yEhG4jYf6/C4CrE6LPl3blYb7XQzMEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-oI9UicVkMUu66JFvAFSWKw-1; Tue, 05 Oct 2021 09:52:07 -0400
X-MC-Unique: oI9UicVkMUu66JFvAFSWKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB02D8145E6;
	Tue,  5 Oct 2021 13:52:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5F1E1F465;
	Tue,  5 Oct 2021 13:52:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18C5D4EA2A;
	Tue,  5 Oct 2021 13:52:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 195Dq1LY009199 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 09:52:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56B2E2166B2F; Tue,  5 Oct 2021 13:52:01 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EF532166B41
	for <linux-cachefs@redhat.com>; Tue,  5 Oct 2021 13:51:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65667899EE9
	for <linux-cachefs@redhat.com>; Tue,  5 Oct 2021 13:51:58 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
	[209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-567-4gwxNCvBMzKMKJHo5davvg-1; Tue, 05 Oct 2021 09:51:57 -0400
X-MC-Unique: 4gwxNCvBMzKMKJHo5davvg-1
Received: by mail-ed1-f69.google.com with SMTP id
	w6-20020a50d786000000b003dabc563406so16302698edi.17
	for <linux-cachefs@redhat.com>; Tue, 05 Oct 2021 06:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9Sq+vV3R3P7TQ0AM4JCbd3k08zMbakaHsPP7Xk3nGbs=;
	b=nWk9TPdPIZIbZsJJ8xlebAVG3dcH7kdPqDJfocC5yXuc4tqCNItwKKA3dr+PD8AeXU
	ZKcvpfeF0hViGT5T5JcVDupWxb6RbGRHFJp0lE4SOvyklHTaIGkVyLVmi2vvcolzD/Zk
	tGX5q/TuPf4up3d2aD3Bkyai0avXRS5jPYRcbedA0BuCcBFWCkouQfNGdfn6kMqQME+g
	UiNQZB+as16yD1yf0JgUruzJcnrf/KLosqHrXzL1U1nc8nwa6K3LnblPih9VwMJkL9Qd
	25EngX7b9aa6MWSG0Rm7aKTRtkpq/RxG1LLnuy7GK8TSEFRqTtiAQwCt/3olDFXA3kxw
	AMJA==
X-Gm-Message-State: AOAM530zYGzopuAY2fo5HrDyeEyBLgJIFVX1KxV72iPoTQAbOOrlrz+A
	bgUdSr4QNTorgtV7H/B7+NeiVSEgqaXOl41Lg4QwqhOOOGt5yNK/Q3EBcsLcKDYQKrPSXKXlfli
	00bdX3Z680jDTqo2aquPTFy0/Qi15earIYyUU6Q==
X-Received: by 2002:a17:906:5e17:: with SMTP id
	n23mr22244010eju.258.1633441915960; 
	Tue, 05 Oct 2021 06:51:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL6wEA9YAWMunwkkS/VUTXjx+I2mT9GQRM0DPKN/EeeZlMmwcjfLRDyQFDf4hyyBsldiJXbt5FEDnfKDYHMbw=
X-Received: by 2002:a17:906:5e17:: with SMTP id
	n23mr22243984eju.258.1633441915769; 
	Tue, 05 Oct 2021 06:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <1633288958-8481-1-git-send-email-dwysocha@redhat.com>
	<1633288958-8481-8-git-send-email-dwysocha@redhat.com>
	<5fe74c4fb9d54c775c07d0f94d0ea187f72e15fe.camel@hammerspace.com>
In-Reply-To: <5fe74c4fb9d54c775c07d0f94d0ea187f72e15fe.camel@hammerspace.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 5 Oct 2021 09:51:18 -0400
Message-ID: <CALF+zOk=KNmBZ4MoW+Gas0JMvVRJJaQRbBRfnW-sm3NVnekygg@mail.gmail.com>
To: Trond Myklebust <trondmy@hammerspace.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v1 7/7] NFS: Remove remaining usages of
	NFSDBG_FSCACHE
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 4, 2021 at 11:57 AM Trond Myklebust <trondmy@hammerspace.com> wrote:
>
> On Sun, 2021-10-03 at 15:22 -0400, Dave Wysochanski wrote:
> > The NFS fscache interface has removed all dfprintks so remove the
> > NFSDBG_FSCACHE defines.
> >
> > Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
> > ---
> >  fs/nfs/fscache-index.c      | 2 --
> >  fs/nfs/fscache.c            | 2 --
> >  include/uapi/linux/nfs_fs.h | 2 +-
> >  3 files changed, 1 insertion(+), 5 deletions(-)
> >
> > diff --git a/fs/nfs/fscache-index.c b/fs/nfs/fscache-index.c
> > index 4bd5ce736193..71bb4270641f 100644
> > --- a/fs/nfs/fscache-index.c
> > +++ b/fs/nfs/fscache-index.c
> > @@ -17,8 +17,6 @@
> >  #include "internal.h"
> >  #include "fscache.h"
> >
> > -#define NFSDBG_FACILITY                NFSDBG_FSCACHE
> > -
> >  /*
> >   * Define the NFS filesystem for FS-Cache.  Upon registration FS-
> > Cache sticks
> >   * the cookie for the top-level index object for NFS into here.  The
> > top-level
> > diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
> > index d199ee103dc6..016e6cb13d28 100644
> > --- a/fs/nfs/fscache.c
> > +++ b/fs/nfs/fscache.c
> > @@ -21,8 +21,6 @@
> >  #include "fscache.h"
> >  #include "nfstrace.h"
> >
> > -#define NFSDBG_FACILITY                NFSDBG_FSCACHE
> > -
> >  static struct rb_root nfs_fscache_keys = RB_ROOT;
> >  static DEFINE_SPINLOCK(nfs_fscache_keys_lock);
> >
> > diff --git a/include/uapi/linux/nfs_fs.h
> > b/include/uapi/linux/nfs_fs.h
> > index 3afe3767c55d..caa8d2234958 100644
> > --- a/include/uapi/linux/nfs_fs.h
> > +++ b/include/uapi/linux/nfs_fs.h
> > @@ -52,7 +52,7 @@
> >  #define NFSDBG_CALLBACK                0x0100
> >  #define NFSDBG_CLIENT          0x0200
> >  #define NFSDBG_MOUNT           0x0400
> > -#define NFSDBG_FSCACHE         0x0800
> > +#define NFSDBG_UNUSED          0x0800 /* unused; was FSCACHE */
>
> Please leave the name and value unchanged. I'm fine with adding the
> comment telling people not to bother using it, but this is supposed to
> be part of a user API so it can't be modified unless we're absolutely
> certain it isn't being used by anyone.
>
Ok I will post a v2 and leave NFSDBG_FSCACHE defined for now but add
the comment.  But once there's no more usages in the kernel, I'm not sure
what the proper way to deprecate and remove it would be though.

I can post a nfs-utils patch to deprecate (or remove) the usage of fscache
in rpcdebug too. What's the proper way to deprecate and remove rpcdebug
flags, or is there some reason we don't ever want to do it?


> The other changes are fine.
>
Thanks for the review.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

