Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 105383032AE
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Jan 2021 05:06:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-bUh5OnuVP82obkNU0cyUKg-1; Mon, 25 Jan 2021 23:06:07 -0500
X-MC-Unique: bUh5OnuVP82obkNU0cyUKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EFDF8145E0;
	Tue, 26 Jan 2021 04:06:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EE5660C67;
	Tue, 26 Jan 2021 04:06:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF4CE4A7C6;
	Tue, 26 Jan 2021 04:06:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10Q462Ip005278 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 23:06:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 83DD11111456; Tue, 26 Jan 2021 04:06:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 800AD1111454
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 04:06:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BC59101A560
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 04:06:00 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-456-IobSfG9vO36yEE9KDaXIEg-1; Mon, 25 Jan 2021 23:05:54 -0500
X-MC-Unique: IobSfG9vO36yEE9KDaXIEg-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1l4Fbo-0053Bl-Gu; Tue, 26 Jan 2021 04:05:43 +0000
Date: Tue, 26 Jan 2021 04:05:40 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210126040540.GK308988@casper.infradead.org>
References: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
	<161161057357.2537118.6542184374596533032.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161161057357.2537118.6542184374596533032.stgit@warthog.procyon.org.uk>
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH 27/32] NFS: Refactor nfs_readpage() and
 nfs_readpage_async() to use nfs_readdesc
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 25, 2021 at 09:36:13PM +0000, David Howells wrote:
> +int nfs_readpage_async(void *data, struct inode *inode,
>  		       struct page *page)
>  {
> +	struct nfs_readdesc *desc = (struct nfs_readdesc *)data;

You don't need a cast to cast from void.

> @@ -440,17 +439,16 @@ int nfs_readpages(struct file *filp, struct address_space *mapping,
>  	if (ret == 0)
>  		goto read_complete; /* all pages were read */
>  
> -	desc.pgio = &pgio;
> -	nfs_pageio_init_read(&pgio, inode, false,
> +	nfs_pageio_init_read(&desc.pgio, inode, false,

I like what you've done here, embedding the pgio in the desc.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

