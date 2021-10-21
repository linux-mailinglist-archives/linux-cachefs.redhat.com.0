Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 341A6436E26
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 01:16:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-K2oGqmIhMi6IOLSrcDvGpg-1; Thu, 21 Oct 2021 19:16:26 -0400
X-MC-Unique: K2oGqmIhMi6IOLSrcDvGpg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AABD71006AA2;
	Thu, 21 Oct 2021 23:16:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E16210429D0;
	Thu, 21 Oct 2021 23:16:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 27B691800FDD;
	Thu, 21 Oct 2021 23:16:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19LNG8f7013502 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 21 Oct 2021 19:16:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F79B2166B2D; Thu, 21 Oct 2021 23:16:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A9A32166B25
	for <linux-cachefs@redhat.com>; Thu, 21 Oct 2021 23:16:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51A2F106655C
	for <linux-cachefs@redhat.com>; Thu, 21 Oct 2021 23:16:05 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-252-ESkX1iUqMaa1abpXYuWTqg-1; Thu, 21 Oct 2021 19:16:03 -0400
X-MC-Unique: ESkX1iUqMaa1abpXYuWTqg-1
Received: by mail-lf1-f52.google.com with SMTP id bp15so2077046lfb.4;
	Thu, 21 Oct 2021 16:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NGd3ZBTVw8WerW8TiXkapULoiLMOJ6XxJFj9gFvuuSU=;
	b=qC1IIRiDuANKaU40r1oolQmUrgZXuzjP4nOXFVm8qyMdMf/oRLHPOPt4ZJKt68iPRB
	fO8YjriZg9PUOKGHi7MOXFL0VobiItnrFuw9zcqp6yxAt4IgjIXXYx+8wY7M0sLBdcOL
	5/EhI8jmGbALGtGMa+mCN6CitHanLc0pcrJb/F9rWNSSiDbDu1ZPlsuz9qd7CWvV6oGz
	TUBPHYtZt25/pRBrADz7IgUOz3NrQ5bzs+syDjKRIOZH3FlZMP50LjUebRuCVJ2RWDWf
	T0/LqFN+RJN4pw7cfSIA0F05VU5+F7xVqqjmBu8I+Z/9ZjYx4KhQKeqBG3hiA1eZPwbh
	pRFQ==
X-Gm-Message-State: AOAM533amXuH7ptPBo/ZrMAOcpvVqLxFYU4lqcZcYCj6eO8da/Od901R
	AZwio0iAMUuNQR/dKKphXhPUOfnTBG4HEw8idjj4sHqJR2o=
X-Google-Smtp-Source: ABdhPJwZpcQ1KdeVcaHk764w6WspHm/7cDejlBv/A5lS6M8tifVYkMndPvZos9ePSqOr5Sy9U5NwiVeDSIz4sIygGiM=
X-Received: by 2002:a05:6512:3763:: with SMTP id
	z3mr8185733lft.601.1634858160588; 
	Thu, 21 Oct 2021 16:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
	<YXHntB2O0ACr0pbz@relinquished.localdomain>
In-Reply-To: <YXHntB2O0ACr0pbz@relinquished.localdomain>
From: Steve French <smfrench@gmail.com>
Date: Thu, 21 Oct 2021 18:15:49 -0500
Message-ID: <CAH2r5msO7-QCXv6JQj2Tado9ZoWAHRkgq6-En18PeKSXFDdBLw@mail.gmail.com>
To: Omar Sandoval <osandov@osandov.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>, linux-mm <linux-mm@kvack.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>, ceph-devel <ceph-devel@vger.kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-nfs <linux-nfs@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 00/67] fscache: Rewrite index API and
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 21, 2021 at 5:21 PM Omar Sandoval <osandov@osandov.com> wrote:
>
> On Mon, Oct 18, 2021 at 03:50:15PM +0100, David Howells wrote:
> However, with the advent of the tmpfile capacity in the VFS, an opportunity
> arises to do invalidation much more easily, without having to wait for I/O
> that's actually in progress: Cachefiles can simply cut over its file
> pointer for the backing object attached to a cookie and abandon the
> in-progress I/O, dismissing it upon completion.

Have changes been made to O_TMPFILE?  It is problematic for network filesystems
because it is not an atomic operation, and would be great if it were possible
to create a tmpfile and open it atomically (at the file system level).

Currently it results in creating a tmpfile (which results in
opencreate then close)
immediately followed by reopening the tmpfile which is somewhat counter to
the whole idea of a tmpfile (ie that it is deleted when closed) since
the syscall results
in two opens ie open(create)/close/open/close


-- 
Thanks,

Steve

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

