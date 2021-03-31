Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D1AC7350303
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Mar 2021 17:14:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-ZgZP6jnVPk-0V-Iic1Molw-1; Wed, 31 Mar 2021 11:13:58 -0400
X-MC-Unique: ZgZP6jnVPk-0V-Iic1Molw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFB99107BEF5;
	Wed, 31 Mar 2021 15:13:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44AEA5C1D1;
	Wed, 31 Mar 2021 15:13:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C2C81809C83;
	Wed, 31 Mar 2021 15:13:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12VFDjZZ012209 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 31 Mar 2021 11:13:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1680AC940; Wed, 31 Mar 2021 15:13:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB5CCAE7CB
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 15:13:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5890805F48
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 15:13:42 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-573-T8TPZBXPOXCkeHuzCGrQ0g-1; Wed, 31 Mar 2021 11:13:40 -0400
X-MC-Unique: T8TPZBXPOXCkeHuzCGrQ0g-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lRcEh-004hdF-5c; Wed, 31 Mar 2021 14:54:35 +0000
Date: Wed, 31 Mar 2021 15:54:23 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Message-ID: <20210331145423.GA1118729@infradead.org>
References: <20210320054104.1300774-1-willy@infradead.org>
	<YFja/LRC1NI6quL6@cmpxchg.org>
	<20210322184744.GU1719932@casper.infradead.org>
	<YFqH3B80Gn8pcPqB@cmpxchg.org>
	<20210324062421.GQ1719932@casper.infradead.org>
	<YF4eX/VBPLmontA+@cmpxchg.org>
	<20210329165832.GG351017@casper.infradead.org>
	<YGN8biqigvPP0SGN@cmpxchg.org>
MIME-Version: 1.0
In-Reply-To: <YGN8biqigvPP0SGN@cmpxchg.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v5 00/27] Memory Folios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 30, 2021 at 03:30:54PM -0400, Johannes Weiner wrote:
> > Eventually, I want to make struct page optional for allocations.  It's too
> > small for some things (allocating page tables, for example), and overly
> > large for others (allocating a 2MB page, networking page_pool).  I don't
> > want to change its size in the meantime; having a struct page refer to
> > PAGE_SIZE bytes is something that's quite deeply baked in.
> 
> Right, I think it's overloaded and it needs to go away from many
> contexts it's used in today.

FYI, one unrelated usage is that in many contet we use a struct page and
an offset to describe locations for I/O (block layer, networking, DMA
API).  With huge pages and merged I/O buffers this representation
actually becomes increasingly painful.

And a little bit back to the topic:  I think the folio as in the
current patchset is incredibly useful and someting we need like
yesterday to help file systems and the block layer to cope with
huge and compound pages of all sorts.  Once willy sends out a new
version with the accumulated fixes I'm ready to ACK the whole thing.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

