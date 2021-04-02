Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5CB352B9E
	for <lists+linux-cachefs@lfdr.de>; Fri,  2 Apr 2021 16:53:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-reE0SYj_Pv2GDsKsnltK-Q-1; Fri, 02 Apr 2021 10:53:54 -0400
X-MC-Unique: reE0SYj_Pv2GDsKsnltK-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 115358030A1;
	Fri,  2 Apr 2021 14:53:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 023265D9DC;
	Fri,  2 Apr 2021 14:53:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 101E31809C83;
	Fri,  2 Apr 2021 14:53:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 132Erm4A001469 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 2 Apr 2021 10:53:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C8A0FA726; Fri,  2 Apr 2021 14:53:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 173A3F97FC
	for <linux-cachefs@redhat.com>; Fri,  2 Apr 2021 14:53:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EA32811E93
	for <linux-cachefs@redhat.com>; Fri,  2 Apr 2021 14:53:45 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-315-7Cbf-iuuP62ZHF6G7sdYNg-1; Fri, 02 Apr 2021 10:53:41 -0400
X-MC-Unique: 7Cbf-iuuP62ZHF6G7sdYNg-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lSKvr-007k8s-W3; Fri, 02 Apr 2021 14:37:57 +0000
Date: Fri, 2 Apr 2021 15:37:55 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210402143755.GA1843620@infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210401070537.GB1363493@infradead.org>
	<20210401112656.GA351017@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210401112656.GA351017@casper.infradead.org>
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
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v6 00/27] Memory Folios
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

On Thu, Apr 01, 2021 at 12:26:56PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 01, 2021 at 08:05:37AM +0100, Christoph Hellwig wrote:
> > On Wed, Mar 31, 2021 at 07:47:01PM +0100, Matthew Wilcox (Oracle) wrote:
> > >  - Mirror members of struct page (for pagecache / anon) into struct folio,
> > >    so (eg) you can use folio->mapping instead of folio->page.mapping
> > 
> > Eww, why?
> 
> So that eventually we can rename page->mapping to page->_mapping and
> prevent the bugs from people doing page->mapping on a tail page.  eg
> https://lore.kernel.org/linux-mm/alpine.LSU.2.11.2103102214170.7159@eggly.anvils/

I'm not sure I like this.  This whole concept of structures that do need
the same layout is very problematic, even with the safe guards you've
added.  So if it was up to me I'd prefer the folio as a simple container
as it was in the previous revisions.  At some point members should move
from the page to the folio, but I'd rather do that over a shorter period
an in targeted series.  We need the basic to go in first.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

