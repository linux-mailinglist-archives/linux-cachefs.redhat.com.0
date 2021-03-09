Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 057AE3321EA
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Mar 2021 10:27:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615282043;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rEMwIaRKw1cBQIijCmt0L6f/6O4u+9y+w+WMhkxDcGk=;
	b=Spoi9ucSgCkkVsNHGSX2xJqpbL+df9vh+yd7qB97897vJxhg2aXjhht1ge+YpY0CThD44b
	00pI4+e2VAzkh10OHl9nQ5WQBBBrTGsoaujIgHlSPMb4dnA5C+47kcBeg8YGToPjHrnFjv
	PBoDt9AGZJtes3llolabXXnqVu4q9EI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-tQA5xC4pPo2YHYC5kLOJYA-1; Tue, 09 Mar 2021 04:27:21 -0500
X-MC-Unique: tQA5xC4pPo2YHYC5kLOJYA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B0D7814315;
	Tue,  9 Mar 2021 09:27:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D83D96062F;
	Tue,  9 Mar 2021 09:27:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 593C41809C84;
	Tue,  9 Mar 2021 09:27:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1299LrFw015245 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Mar 2021 04:21:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 90E405B4B3; Tue,  9 Mar 2021 09:21:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-152.rdu2.redhat.com
	[10.10.118.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9F7059458;
	Tue,  9 Mar 2021 09:21:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210308215535.GA63242@dread.disaster.area>
References: <20210308215535.GA63242@dread.disaster.area>
	<CAOQ4uxhxwKHLT559f8v5aFTheKgPUndzGufg0E58rkEqa9oQ3Q@mail.gmail.com>
	<2653261.1614813611@warthog.procyon.org.uk>
	<517184.1615194835@warthog.procyon.org.uk>
To: Dave Chinner <david@fromorbit.com>
MIME-Version: 1.0
Date: Tue, 09 Mar 2021 09:21:45 +0000
Message-ID: <152281.1615281705@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1299LrFw015245
X-loop: linux-cachefs@redhat.com
Cc: "J. Bruce Fields" <bfields@fieldses.org>,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>, CIFS <linux-cifs@vger.kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Miklos Szeredi <miklos@szeredi.hu>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dave Chinner <dchinner@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net,
	ceph-devel <ceph-devel@vger.kernel.org>, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] fscache: Redesigning the on-disk cache
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <152280.1615281705.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dave Chinner <david@fromorbit.com> wrote:

> > > With ->fiemap() you can at least make the distinction between a non
> > > existing and an UNWRITTEN extent.
> > 
> > I can't use that for XFS, Ext4 or btrfs, I suspect.  Christoph and Dave's
> > assertion is that the cache can't rely on the backing filesystem's metadata
> > because these can arbitrarily insert or remove blocks of zeros to bridge or
> > split extents.
> 
> Well, that's not the big problem. The issue that makes FIEMAP
> unusable for determining if there is user data present in a file is
> that on-disk extent maps aren't exactly coherent with in-memory user
> data state.
> 
> That is, we can have a hole on disk with delalloc user data in
> memory.  There's user data in the file, just not on disk. Same goes
> for unwritten extents - there can be dirty data in memory over an
> unwritten extent, and it won't get converted to written until the
> data is written back and the filesystem runs a conversion
> transaction.
> 
> So, yeah, if you use FIEMAP to determine where data lies in a file
> that is being actively modified, you're going get corrupt data
> sooner rather than later.  SEEK_HOLE/DATA are coherent with in
> memory user data, so don't have this problem.

I thought you and/or Christoph said it *was* a problem to use the backing
filesystem's metadata to track presence of data in the cache because the
filesystem (or its tools) can arbitrarily insert blocks of zeros to
bridge/break up extents.

If that is the case, then that is a big problem, and SEEK_HOLE/DATA won't
suffice.

If it's not a problem - maybe if I can set a mark on a file to tell the
filesystem and tools not to do that - then that would obviate the need for me
to store my own maps.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

