Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8406435152A
	for <lists+linux-cachefs@lfdr.de>; Thu,  1 Apr 2021 15:30:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-MU1t8yc1PAuJQfWX0Sqkrw-1; Thu, 01 Apr 2021 09:30:49 -0400
X-MC-Unique: MU1t8yc1PAuJQfWX0Sqkrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03646800D53;
	Thu,  1 Apr 2021 13:30:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A44AC5D9CC;
	Thu,  1 Apr 2021 13:30:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58A7A1809C83;
	Thu,  1 Apr 2021 13:30:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 131DUgYJ021343 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 1 Apr 2021 09:30:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83FB02157F23; Thu,  1 Apr 2021 13:30:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DD4B2157F24
	for <linux-cachefs@redhat.com>; Thu,  1 Apr 2021 13:30:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A55A185A7B6
	for <linux-cachefs@redhat.com>; Thu,  1 Apr 2021 13:30:39 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-330-1chMXCAMO6GtgqeX-mrgzg-1; Thu, 01 Apr 2021 09:30:36 -0400
X-MC-Unique: 1chMXCAMO6GtgqeX-mrgzg-1
Received: by mail-qk1-f174.google.com with SMTP id g15so2148298qkl.4
	for <linux-cachefs@redhat.com>; Thu, 01 Apr 2021 06:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=w/7ssEDMUVD4QlYKgBNJoPZ/Vwpdfp7p9SjtiE2HkVw=;
	b=DeucK+lon9hr0ahu3VHfOOav21WJgS1DcgUHgc4Q6p5dkly5KGSs0Fqve6SDTZpsfT
	dCR+rdAzJNYG9YccckCWAxuFmJBdn3fYQaNdqf5NdaBQAVQM4r4nN3nJCjRYgup2DjoK
	ERWJlJCGXUeiDQD+dnhWyY8LPPA7eiBWrztDSlQb800/mqGMI9pyBAN676cKti2MpTmV
	YVqkUpIGywxaHucgIdj6+iwf6w3lfVfkDYovaB1AsiVe8cXy71x+koxLh1fhmq/OrwRx
	4FXkymCamndET1zqNJ27NrimjYRJo/g5nxnaWkH4lZ+Gm2mqYvMG4HPN9kbqatPcDKEF
	bqBw==
X-Gm-Message-State: AOAM533a9HwmnXSSeHJISlj5uWAflPYth/c93z3Jlm9BPNOhQJ2vPQZp
	7ZIzIDc9Tdg+vf9uF9BUALGHSg==
X-Google-Smtp-Source: ABdhPJwY/Erz6f9mFV6feM+OIMmzbcrd0Oem+ltCCxeD8d8BAt0sMjxB8TtGsmIhiYyPHtNa/an8xQ==
X-Received: by 2002:a37:596:: with SMTP id 144mr8617287qkf.387.1617283836177; 
	Thu, 01 Apr 2021 06:30:36 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[142.162.115.133])
	by smtp.gmail.com with ESMTPSA id x7sm3413511qtp.10.2021.04.01.06.30.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 01 Apr 2021 06:30:35 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
	id 1lRxP8-006knq-LW; Thu, 01 Apr 2021 10:30:34 -0300
Date: Thu, 1 Apr 2021 10:30:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210401133034.GF2710221@ziepe.ca>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210401070537.GB1363493@infradead.org>
	<20210401112656.GA351017@casper.infradead.org>
	<20210401122803.GB2710221@ziepe.ca>
	<20210401125201.GD351017@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210401125201.GD351017@casper.infradead.org>
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

On Thu, Apr 01, 2021 at 01:52:01PM +0100, Matthew Wilcox wrote:
> On Thu, Apr 01, 2021 at 09:28:03AM -0300, Jason Gunthorpe wrote:
> > On Thu, Apr 01, 2021 at 12:26:56PM +0100, Matthew Wilcox wrote:
> > > On Thu, Apr 01, 2021 at 08:05:37AM +0100, Christoph Hellwig wrote:
> > > > On Wed, Mar 31, 2021 at 07:47:01PM +0100, Matthew Wilcox (Oracle) wrote:
> > > > >  - Mirror members of struct page (for pagecache / anon) into struct folio,
> > > > >    so (eg) you can use folio->mapping instead of folio->page.mapping
> > > > 
> > > > Eww, why?
> > > 
> > > So that eventually we can rename page->mapping to page->_mapping and
> > > prevent the bugs from people doing page->mapping on a tail page.  eg
> > > https://lore.kernel.org/linux-mm/alpine.LSU.2.11.2103102214170.7159@eggly.anvils/
> > 
> > Is that gcc structure layout randomization stuff going to be a problem
> > here?
> > 
> > Add some 
> >   static_assert(offsetof(struct folio,..) == offsetof(struct page,..))
> > 
> > tests to force it?
> 
> You sound like the kind of person who hasn't read patch 1.

Yes, I missed this hunk :)

Jason

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

