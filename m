Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF06D437E9E
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 21:26:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-8alk1AKNMKKW5GpJIOpv6g-1; Fri, 22 Oct 2021 15:26:38 -0400
X-MC-Unique: 8alk1AKNMKKW5GpJIOpv6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEB4710A8E00;
	Fri, 22 Oct 2021 19:26:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77DCB5BAF8;
	Fri, 22 Oct 2021 19:26:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 141EE4EA2A;
	Fri, 22 Oct 2021 19:26:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MJLiBL013954 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 15:21:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1BCEF2026D60; Fri, 22 Oct 2021 19:21:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1647A2026D46
	for <linux-cachefs@redhat.com>; Fri, 22 Oct 2021 19:21:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7C33811E76
	for <linux-cachefs@redhat.com>; Fri, 22 Oct 2021 19:21:39 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
	[209.85.167.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-209-cZGWMKldOm6L57OZBT1NOg-1; Fri, 22 Oct 2021 15:21:37 -0400
X-MC-Unique: cZGWMKldOm6L57OZBT1NOg-1
Received: by mail-lf1-f53.google.com with SMTP id x192so251202lff.12
	for <linux-cachefs@redhat.com>; Fri, 22 Oct 2021 12:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6MIYbiqTAgOZcVD7o78/iMiC5v0PdYgNzQoieL1dnhA=;
	b=8Mi8jvZ/MoGz+jICDAy76+jMWs+vfKG8ve9pLxNM7FrWrcl/0zTjEAv0AB7OsWSjd6
	0g1n3S+evVflkBoqLupXoTvEZWuGgLnWYhtWYEfFQG76xehQCtaItFXWyQzs6Ta+u163
	FNfres8/SDjmpVv1IAbLGCXYEGW3WTcZc4DLvG+f4yHDUOZ9lfPT8mY+BzdRsJeTHD24
	SVR8Uixe4Is4vup/nD74S/iQoXQEDLwH3bJf8Ks8YxDA666ZN59I8X/9DGvpbf6ib4+E
	+L+ABhp6EdqtiwVx+hNWeR8rMd6qqGVaJJV0Cg16PojPORcV+MTufHqzpNWeF3/JsqcP
	uupA==
X-Gm-Message-State: AOAM532Kwu/7fi7PHeng3jCrLG8pEbFukQnmige8UcoHQlIfED3XfBbS
	0gFwavK5Lc7vYS8dlkynF/s7+mWxp+TCuqx/
X-Google-Smtp-Source: ABdhPJxLbgarHsxZrxBZFUR/TWOHwn7ah2jdW9Ol74ryl0hWVRoO67tgSWuvAzOORKnyp+UID5TXRg==
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr1419642lfp.275.1634930494498; 
	Fri, 22 Oct 2021 12:21:34 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
	[209.85.167.50])
	by smtp.gmail.com with ESMTPSA id f16sm970183ljn.19.2021.10.22.12.21.31
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 22 Oct 2021 12:21:32 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id br29so1629734lfb.7
	for <linux-cachefs@redhat.com>; Fri, 22 Oct 2021 12:21:31 -0700 (PDT)
X-Received: by 2002:a19:ad0c:: with SMTP id t12mr1362164lfc.173.1634930491229; 
	Fri, 22 Oct 2021 12:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
In-Reply-To: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Oct 2021 09:21:15 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjmx7+PD0hzWj5Bg2b807xYD2KCZApTvFje=ufo+MxBMQ@mail.gmail.com>
Message-ID: <CAHk-=wjmx7+PD0hzWj5Bg2b807xYD2KCZApTvFje=ufo+MxBMQ@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Jeff Layton <jlayton@kernel.com>, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	"open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Steve French <sfrench@samba.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Omar Sandoval <osandov@osandov.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v2 00/53] fscache: Rewrite index API and
	management system
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 22, 2021 at 8:58 AM David Howells <dhowells@redhat.com> wrote:
>
> David Howells (52):
>       fscache_old: Move the old fscache driver to one side
>       fscache_old: Rename CONFIG_FSCACHE* to CONFIG_FSCACHE_OLD*
>       cachefiles_old:  Move the old cachefiles driver to one side

Honestly, I don't see the point of this when it ends up just being
dead code basically immediately.

You don't actually support picking one or the other at build time,
just a hard switch-over.

That makes the old fscache driver useless. You can't say "use the old
one because I don't trust the new". You just have a legacy
implementation with no users.

              Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

