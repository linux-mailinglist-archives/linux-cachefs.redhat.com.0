Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5E22A2B7E71
	for <lists+linux-cachefs@lfdr.de>; Wed, 18 Nov 2020 14:42:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605706924;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zo/qfTNtlFJd9bOfxZg40NMPqXGcsLdQa8cwdSKMAGg=;
	b=EBtDcCoU4HNtCS/sVQIHSvM8EybrRkLZcPRa95iIJYQwXx/9bz+/9vPFnJnSRr/rkM7uJ2
	nvSiXcoTPXCB7Wbq1xcNpCa6+cDmtWTFu/MO+qQO0t/VyjI2bVjQ39bBHyvdlFRgnHr4Sk
	GoT+xMddxWlYZ8Ozf7Z28Lh5KRevSec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-Z-M7ov8GPUKMOiDU3HrVaQ-1; Wed, 18 Nov 2020 08:42:02 -0500
X-MC-Unique: Z-M7ov8GPUKMOiDU3HrVaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E885D80EDA1;
	Wed, 18 Nov 2020 13:41:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EFE5196FB;
	Wed, 18 Nov 2020 13:41:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F234CF45;
	Wed, 18 Nov 2020 13:41:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AIDcXMG004575 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 08:38:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3934E51512; Wed, 18 Nov 2020 13:38:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-246.rdu2.redhat.com
	[10.10.112.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD6805B4BE;
	Wed, 18 Nov 2020 13:38:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20201118124826.GA17850@nautica>
References: <20201118124826.GA17850@nautica>
	<1514086.1605697347@warthog.procyon.org.uk>
To: Dominique Martinet <asmadeus@codewreck.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2020 13:38:27 +0000
Message-ID: <1561011.1605706707@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AIDcXMG004575
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH] 9p: Convert to new fscache API
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1561010.1605706707.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dominique Martinet <asmadeus@codewreck.org> wrote:

> What's the current schedule/plan for the fscache branch merging? Will
> you be trying this merge window next month?

That's the aim.  We have afs, ceph and nfs are about ready; I've had a go at
doing the 9p conversion, which I'll have to leave to you now, I think, and am
having a poke at cifs.

> >  (*) I have made an assumption that 9p_client_read() and write can handle I/Os
> >      larger than a page.  If this is not the case, v9fs_req_ops will need
> >      clamp_length() implementing.
> 
> There's a max driven by the client's msize

The netfs read helpers provide you with a couple of options here:

 (1) You can use ->clamp_length() to do multiple slices of at least 1 byte
     each.  The assumption being that these represent parallel operations.  A
     new subreq will be generated for each slice.

 (2) You can go with large slices that are larger than msize, and just read
     part of it with each read.  After reading, the netfs helper will keep
     calling you again to read some more of it, provided you didn't return an
     error and you at least read something.

> (client->msize - P9_IOHDRSZ ; unfortunately msize is just guaranted to be >=
> 4k so that means the actual IO size would be smaller in that case even if
> that's not intended to be common)

Does that mean you might be limited to reads of less than PAGE_SIZE on some
systems (ppc64 for example)?  This isn't a problem for the read helper, but
might be an issue for writing from THPs.

> >  (*) The cache needs to be invalidated if a 3rd-party change happens, but I
> >      haven't done that.
> 
> There's no concurrent access logic in 9p as far as I'm aware (like NFS
> does if the mtime changes for example), so I assume we can keep ignoring
> this.

By that, I presume you mean concurrent accesses are just not permitted?

> >  (*) If 9p supports DIO writes, it should invalidate a cache object with
> >      FSCACHE_INVAL_DIO_WRITE when one happens - thereby stopping caching for
> >      that file until all file handles on it are closed.
> 
> Not 100% sure actually there is some code about it but comment says it's
> disabled when cache is active; I'll check just found another problem
> with some queued patch that need fixing first...

Ok.

> > I forgot something: netfs_subreq_terminated() needs to be called when
> > the read is complete.  If p9_client_read() is synchronous, then that
> > would be here,
> 
> (it is synchronous; I'll add that suggestion)

Thanks.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

