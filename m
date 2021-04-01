Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6FAE53514EB
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Apr 2021 14:55:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-rBxq5OOMMRKXq-5GUrCRkw-1; Thu, 01 Apr 2021 08:55:02 -0400
X-MC-Unique: rBxq5OOMMRKXq-5GUrCRkw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48ABF801FD8;
	Thu,  1 Apr 2021 12:55:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 311FB19C46;
	Thu,  1 Apr 2021 12:55:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9E3F1809C83;
	Thu,  1 Apr 2021 12:54:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 131CSAoY015761 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 08:28:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 128A1112CA2C; Thu,  1 Apr 2021 12:28:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E349112CA2A
	for <linux-cachefs@redhat.com>; Thu,  1 Apr 2021 12:28:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99AC9185A7B6
	for <linux-cachefs@redhat.com>; Thu,  1 Apr 2021 12:28:07 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-574-LoasjcY-M6eGuq0gl_6P7Q-1; Thu, 01 Apr 2021 08:28:05 -0400
X-MC-Unique: LoasjcY-M6eGuq0gl_6P7Q-1
Received: by mail-qk1-f172.google.com with SMTP id x14so1911772qki.10
	for <linux-cachefs@redhat.com>; Thu, 01 Apr 2021 05:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=S2lOqshgmzLNhO0Nubkd7SMctWNe6/PwkffE1ihM8go=;
	b=GJ4nDw3nUeaVB6Ml7T9KExP+LG31gfZqXa39BrzLI3fZh/7x1adVZOH0Rii6AAC6qX
	aJcJ8xxGzHIxmyuP445ATsnRE55x2yDmuD4cHRwPrsx5vuVzhrcAcZKHHzUs2uIWEIy8
	MeXDbbnE3fi6Y6ifqvNAnjTxeRW4mz+gC2Y4eznaFFRZyUH9RR9VYgotiNJBcS7E+5i/
	qTG2VeCpl9m9lcNVOjzP4T4KJYMBGPSzzoEHBED7U+cJktdFRKNFV1kLUwwonFXxfUFY
	rvV2kJSPJrGyVHXILYL5WBZyllBqK5VE5TDuvqCKnlsiwLDG3xk6CNdB/e80718j65Zq
	rhtg==
X-Gm-Message-State: AOAM533ijzqG+C/y6ya7/rYAwpzlH4kZ2+9iji0+vtrR0DPDlNNxCwAQ
	J6S/WCmWxXmdnLk9THx7lxfI3js88ZrA2vZ2
X-Google-Smtp-Source: ABdhPJx0uj4bLqv9+WIZDVq4iNjdBcpawuNSS1qIonBNVvkFxbwfdgcwwyy4CiyIWV1Llh5w+umxiQ==
X-Received: by 2002:a05:620a:16d3:: with SMTP id
	a19mr7877674qkn.88.1617280085277; 
	Thu, 01 Apr 2021 05:28:05 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[142.162.115.133])
	by smtp.gmail.com with ESMTPSA id d2sm3218920qte.84.2021.04.01.05.28.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 01 Apr 2021 05:28:04 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
	id 1lRwQd-006jmF-Tc; Thu, 01 Apr 2021 09:28:03 -0300
Date: Thu, 1 Apr 2021 09:28:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210401122803.GB2710221@ziepe.ca>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210401070537.GB1363493@infradead.org>
	<20210401112656.GA351017@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210401112656.GA351017@casper.infradead.org>
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
X-Mailman-Approved-At: Thu, 01 Apr 2021 08:54:58 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Is that gcc structure layout randomization stuff going to be a problem
here?

Add some 
  static_assert(offsetof(struct folio,..) == offsetof(struct page,..))

tests to force it?

Jason

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

