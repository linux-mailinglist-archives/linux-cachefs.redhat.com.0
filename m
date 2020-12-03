Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 27AE62CDAA0
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 17:05:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607011544;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gqrn76li8MFohoHDWVwtGck8hyMY+PmdUGbtjdmn2Mg=;
	b=XfBKmRR7jx6eyitYyeIZ6pjCAN/s9hUdV4a9/FuTt0a46nqmmTwZ2qZDewmatkZc+NjaBE
	XXrsm+6boZt5YM+KdB32JD2lhMKkFqndWZJ1Zvsvty67rfaaiECZieM7KMhG1Fjwf3mZP4
	HYk//HUBbxNKtAtz2YD4ApeqRefYRHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-TQ8cOOhIN6-F3AV_HsF66g-1; Thu, 03 Dec 2020 11:05:42 -0500
X-MC-Unique: TQ8cOOhIN6-F3AV_HsF66g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17EA1BBF0D;
	Thu,  3 Dec 2020 16:04:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8EB01A919;
	Thu,  3 Dec 2020 16:04:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F685180954D;
	Thu,  3 Dec 2020 16:04:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3G4BnB027913 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 11:04:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 76D985B4A0; Thu,  3 Dec 2020 16:04:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-159.rdu2.redhat.com
	[10.10.112.159])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22112189C4;
	Thu,  3 Dec 2020 16:04:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20201203155043.GI11935@casper.infradead.org>
References: <20201203155043.GI11935@casper.infradead.org>
	<914680.1607004656@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Thu, 03 Dec 2020 16:04:09 +0000
Message-ID: <1022188.1607011449@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3G4BnB027913
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, linux-cachefs@redhat.com,
	dchinner@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] Problems doing DIO to netfs cache on XFS from
	Ceph
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
Content-ID: <1022187.1607011449.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> > Note that I'm only doing async DIO reads and writes, so I was a bit surprised
> > that XFS is doing a writeback at all - but I guess that IOCB_DIRECT is
> > actually just a hint and the filesystem can turn it into buffered I/O if it
> > wants.
> 
> That's almost the exact opposite of what is going on.  XFS sees that
> you're going to do an O_DIRECT read, so it writes back the dirty memory
> that's currently in the page cache so that your read doesn't read stale
> data from disk.

In this trace, yes, that's true - but where did the dirty memory in the
pagecache come from?  I'm only doing DIO reads and DIO writes - oh, and as it
turns out, fallocate(FALLOC_FL_ZERO_RANGE) - which, I think, may be the source
of the dirty data.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

