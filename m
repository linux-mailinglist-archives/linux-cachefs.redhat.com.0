Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1F5437F53
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 22:27:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-XA2BFNu4PBGXrL-ecrk41Q-1; Fri, 22 Oct 2021 16:27:49 -0400
X-MC-Unique: XA2BFNu4PBGXrL-ecrk41Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FE661808317;
	Fri, 22 Oct 2021 20:27:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F6FA5D9DE;
	Fri, 22 Oct 2021 20:27:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 537334A702;
	Fri, 22 Oct 2021 20:27:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MKP8s6018918 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 16:25:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 918EF1007259; Fri, 22 Oct 2021 20:25:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C0C710070B8
	for <linux-cachefs@redhat.com>; Fri, 22 Oct 2021 20:25:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CCBD899EC0
	for <linux-cachefs@redhat.com>; Fri, 22 Oct 2021 20:25:03 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
	[209.85.208.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-525--jw8PnFEMumJlsGGkXozjg-1; Fri, 22 Oct 2021 16:25:01 -0400
X-MC-Unique: -jw8PnFEMumJlsGGkXozjg-1
Received: by mail-lj1-f169.google.com with SMTP id u5so1488055ljo.8
	for <linux-cachefs@redhat.com>; Fri, 22 Oct 2021 13:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VL4lca6iHsx6oQ/wg6H7clLpP/uNe7ZsGNa7hBqT+88=;
	b=GOhLLMv34WepypoBBgzE5KOzPr19gDhCnHCB0aUN8UiAWm7XPdAKwMjLsHRzTBWfGN
	e3VYz1IesCa2l0B43BlmS57QnbQvK1KH0cPEbNZC9QSIm6rdc8MV0WA/Tlx1s3TSFEld
	zqOEa4L6b6Djfxs8I8j5Uy1kxX2UkMP5jdeRQh7y/xEFt6iZSz1vuyWgGvaeqQgrVfqp
	amDFoN3cS3/KzNrzlQNVOumTT/FIQELoK2b5y4r7VjDcBNE/XLS9uqpDw8fzCBS1nx75
	WowlcBeRxOvOiZPU//cDHIAZO3l/xYvzKQtxYk0NcMd4e7V/ruaj9og6BkF034mTiv+8
	Ff5Q==
X-Gm-Message-State: AOAM5305D/Rc/mbb1WQny8ztO5TksdOtJ3f3gnCYfG2v0o71ejO23b7B
	wNPlIGNq6fb8ybCVVzdwBP5ry8nJ4sr63AciCI4=
X-Google-Smtp-Source: ABdhPJwV/4pcmmzcr24VLvnl87mq28HzwcAchhNjVkXsr3B2//PaA5WgsMxtEpmlFleJbARHtGPAXQ==
X-Received: by 2002:a05:651c:113b:: with SMTP id
	e27mr2250758ljo.137.1634934299170; 
	Fri, 22 Oct 2021 13:24:59 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
	[209.85.208.173])
	by smtp.gmail.com with ESMTPSA id w2sm895126lfq.0.2021.10.22.13.24.57
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 22 Oct 2021 13:24:58 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id w23so3459844lje.7
	for <linux-cachefs@redhat.com>; Fri, 22 Oct 2021 13:24:57 -0700 (PDT)
X-Received: by 2002:a2e:9945:: with SMTP id r5mr2174611ljj.249.1634934297582; 
	Fri, 22 Oct 2021 13:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <163492911924.1038219.13107463173777870713.stgit@warthog.procyon.org.uk>
	<CAHk-=wjmx7+PD0hzWj5Bg2b807xYD2KCZApTvFje=ufo+MxBMQ@mail.gmail.com>
	<1041557.1634931616@warthog.procyon.org.uk>
	<CAHk-=wg2LQtWC3e4Z4EGQzEmsLjmk6jm67Ga6UMLY1MH6iDcNQ@mail.gmail.com>
In-Reply-To: <CAHk-=wg2LQtWC3e4Z4EGQzEmsLjmk6jm67Ga6UMLY1MH6iDcNQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 22 Oct 2021 10:24:41 -1000
X-Gmail-Original-Message-ID: <CAHk-=wi7K64wo4PtROxq_cLhfq-c-3aCbW5CjRfnKYA439YFUw@mail.gmail.com>
Message-ID: <CAHk-=wi7K64wo4PtROxq_cLhfq-c-3aCbW5CjRfnKYA439YFUw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 22, 2021 at 9:58 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> and if (c) is the thing that all the network filesystem people want,
> then what the heck is the point in keeping dead code around? At that
> point, all the rename crap is just extra work, extra noise, and only a
> distraction. There's no upside that I can see.

Again, I'm not a fan of (c) as an option, but if done, then the
simplest model would appear to be:

 - remove the old fscache code, obviously disabling the Kconfig for it
for each filesystem, all in one fell swoop.

 - add the new fscache code (possibly preferably in sane chunks that
explains the parts).

 - then do a "convert to new world order and enable" commit
individually for each filesystem

but as mentioned, there's no sane way to bisect things, or have a sane
development history in this kind of situation.

                Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

