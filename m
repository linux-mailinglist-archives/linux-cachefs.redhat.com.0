Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D1B4A359D0E
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 13:17:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-x9dcOQuBPbSVxXjCDgHaPA-1; Fri, 09 Apr 2021 07:17:54 -0400
X-MC-Unique: x9dcOQuBPbSVxXjCDgHaPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0539B1856A63;
	Fri,  9 Apr 2021 11:17:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B446F5DAA5;
	Fri,  9 Apr 2021 11:17:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A926E1806D0F;
	Fri,  9 Apr 2021 11:17:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139BHlwU030602 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 07:17:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F74E1037B7; Fri,  9 Apr 2021 11:17:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39FFA10482E
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 11:17:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8B23800883
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 11:17:44 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-431-IiPGMQ3pOWuL0ufPOBATWw-1; Fri, 09 Apr 2021 07:17:42 -0400
X-MC-Unique: IiPGMQ3pOWuL0ufPOBATWw-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lUp7s-000GjE-Mr; Fri, 09 Apr 2021 11:17:01 +0000
Date: Fri, 9 Apr 2021 12:16:36 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210409111636.GR2531743@casper.infradead.org>
References: <CAHk-=wi_XrtTanTwoKs0jwnjhSvwpMYVDJ477VtjvvTXRjm5wQ@mail.gmail.com>
	<161796595714.350846.1547688999823745763.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161796595714.350846.1547688999823745763.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 09, 2021 at 11:59:17AM +0100, David Howells wrote:
> Make functions that test page bits return a bool, not an int.  This means
> that the value is definitely 0 or 1 if they're used in arithmetic, rather
> than rely on test_bit() and friends to return this (though they probably
> should).

iirc i looked at doing this as part of the folio work, and it ended up
increasing the size of the kernel.  Did you run bloat-o-meter on the
result of doing this?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

