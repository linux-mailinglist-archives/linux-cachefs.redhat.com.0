Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D5837359E28
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 14:00:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617969653;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=39H49ZOKAoxBF4sLBhKVjZa+hjxs2iCQ+WVsTVjAqlw=;
	b=Mkvz2fOMwXTKX4J28a/F1goEuxFUoMSziGbQLxqaEzeie63a/kAoPpcZWoIgex6r7uPMLO
	FvRsLapsVGM9GimQrXa60vvFDCQHtV6ZrYwdHL4HOdkj6yt1LmJM0vsXW3s0zKbKO5CYE6
	s8B18LKJbApGUJN8MwoD30s+yrMpxLM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-Q9-dfWIANGCrDYSVlWAYZw-1; Fri, 09 Apr 2021 08:00:52 -0400
X-MC-Unique: Q9-dfWIANGCrDYSVlWAYZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A52208070FF;
	Fri,  9 Apr 2021 12:00:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BDB6960BE5;
	Fri,  9 Apr 2021 12:00:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 094F655345;
	Fri,  9 Apr 2021 12:00:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139C0i2h002808 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 08:00:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A84A60CE6; Fri,  9 Apr 2021 12:00:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C29B160622;
	Fri,  9 Apr 2021 12:00:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210409111636.GR2531743@casper.infradead.org>
References: <20210409111636.GR2531743@casper.infradead.org>
	<CAHk-=wi_XrtTanTwoKs0jwnjhSvwpMYVDJ477VtjvvTXRjm5wQ@mail.gmail.com>
	<161796595714.350846.1547688999823745763.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Fri, 09 Apr 2021 13:00:40 +0100
Message-ID: <453417.1617969640@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, jlayton@kernel.org,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-mm@kvack.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>,
	torvalds@linux-foundation.org, hch@lst.de
Subject: Re: [Linux-cachefs] [RFC PATCH 2/3] mm: Return bool from pagebit
	test functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <453416.1617969640.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> On Fri, Apr 09, 2021 at 11:59:17AM +0100, David Howells wrote:
> > Make functions that test page bits return a bool, not an int.  This means
> > that the value is definitely 0 or 1 if they're used in arithmetic, rather
> > than rely on test_bit() and friends to return this (though they probably
> > should).
> 
> iirc i looked at doing this as part of the folio work, and it ended up
> increasing the size of the kernel.  Did you run bloat-o-meter on the
> result of doing this?

Hmmm.  With my usual monolithic x86_64 kernel, it makes vmlinux text section
100 bytes larger (19392347 rather than 19392247).  I can look into why.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

