Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 129D23A5B25
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Jun 2021 02:09:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-BdPjGgNzOxm4n992OJU33A-1; Sun, 13 Jun 2021 20:09:52 -0400
X-MC-Unique: BdPjGgNzOxm4n992OJU33A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B26A31084F46;
	Mon, 14 Jun 2021 00:09:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3994210013C1;
	Mon, 14 Jun 2021 00:09:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C02A146F82;
	Mon, 14 Jun 2021 00:09:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15E09jhR015411 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 13 Jun 2021 20:09:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B86D92023433; Mon, 14 Jun 2021 00:09:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4CD7202348B
	for <linux-cachefs@redhat.com>; Mon, 14 Jun 2021 00:09:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 044C2800C00
	for <linux-cachefs@redhat.com>; Mon, 14 Jun 2021 00:09:43 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-70-sP_DPMDVOvKVGd-BeszCyA-1; Sun, 13 Jun 2021 20:09:40 -0400
X-MC-Unique: sP_DPMDVOvKVGd-BeszCyA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lsa9F-004tqR-IF; Mon, 14 Jun 2021 00:08:32 +0000
Date: Mon, 14 Jun 2021 01:08:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <YMad7WZ4PbHTPTxd@casper.infradead.org>
References: <20210613233345.113565-1-jlayton@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210613233345.113565-1-jlayton@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: Andrew W Elble <aweits@rit.edu>, linux-cachefs@redhat.com, pfmeec@rit.edu,
	idryomov@gmail.com, ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: fix test for whether we can skip
 read when writing beyond EOF
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jun 13, 2021 at 07:33:45PM -0400, Jeff Layton wrote:
> +static bool prep_noread_page(struct page *page, loff_t pos, size_t len)
>  {
> -	unsigned int i;
> +	struct inode *inode = page->mapping->host;
> +	loff_t i_size = i_size_read(inode);
> +	pgoff_t index = pos / thp_size(page);
> +	size_t offset = offset_in_page(pos);

offset_in_thp(page, pos);

With that change:

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

