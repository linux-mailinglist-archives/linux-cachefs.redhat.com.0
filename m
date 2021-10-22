Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC2D437CD7
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Oct 2021 20:58:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634929091;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=roQBWP6YIdaO/tdxp+X9cjBrb37VMDRtdD2LS3RviDY=;
	b=TIL+O8QlEsSIR9R3X+pbHYqVgwGxV5Vne2k+I2f+jy3+SiTSXeGjCIDFPeOhyil0LmPhF6
	4h0cPFo5C32OyuvX4A2njtqO2TneXDTg279t1p4u5i9GcyZhNGrqwKwxEoSM/kZ/0QOirX
	uNwaAaHmiWkn0KMagwown0pMJ+CGgJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-CFq1assLOnmilnsgKZTReQ-1; Fri, 22 Oct 2021 14:58:08 -0400
X-MC-Unique: CFq1assLOnmilnsgKZTReQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B41DD1006AA2;
	Fri, 22 Oct 2021 18:58:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05DCAADF9;
	Fri, 22 Oct 2021 18:58:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 730951800B9E;
	Fri, 22 Oct 2021 18:58:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19MIqSpa011176 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Oct 2021 14:52:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B16760CC3; Fri, 22 Oct 2021 18:52:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA62C60C04;
	Fri, 22 Oct 2021 18:52:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAH2r5msO7-QCXv6JQj2Tado9ZoWAHRkgq6-En18PeKSXFDdBLw@mail.gmail.com>
References: <CAH2r5msO7-QCXv6JQj2Tado9ZoWAHRkgq6-En18PeKSXFDdBLw@mail.gmail.com>
	<163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
	<YXHntB2O0ACr0pbz@relinquished.localdomain>
To: Steve French <smfrench@gmail.com>
MIME-Version: 1.0
Date: Fri, 22 Oct 2021 19:52:18 +0100
Message-ID: <1037424.1634928738@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 19MIqSpa011176
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
	Omar Sandoval <osandov@osandov.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1037423.1634928738.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Steve French <smfrench@gmail.com> wrote:

> On Thu, Oct 21, 2021 at 5:21 PM Omar Sandoval <osandov@osandov.com> wrote:
> >
> > On Mon, Oct 18, 2021 at 03:50:15PM +0100, David Howells wrote:
> > However, with the advent of the tmpfile capacity in the VFS, an opportunity
> > arises to do invalidation much more easily, without having to wait for I/O
> > that's actually in progress: Cachefiles can simply cut over its file
> > pointer for the backing object attached to a cookie and abandon the
> > in-progress I/O, dismissing it upon completion.
> 
> Have changes been made to O_TMPFILE?  It is problematic for network
> filesystems because it is not an atomic operation, and would be great if it
> were possible to create a tmpfile and open it atomically (at the file system
> level).

In this case, it's nothing to do with the network filesystem that's using the
cache per se.  Cachefiles is using tmpfiles on the backing filesystem, so as
long as that's, say, ext4, xfs or btrfs, it should work fine.  The backing
filesystem also needs to support SEEK_HOLE and SEEK_DATA.

I'm not sure I'd recommend putting your cache on a network filesystem.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

