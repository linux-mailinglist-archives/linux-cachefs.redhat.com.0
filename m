Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 67D5236BB11
	for <lists+linux-cachefs@lfdr.de>; Mon, 26 Apr 2021 23:12:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-ork0MQ1RNQygZPlO0h1SVw-1; Mon, 26 Apr 2021 17:12:20 -0400
X-MC-Unique: ork0MQ1RNQygZPlO0h1SVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 971A887A83C;
	Mon, 26 Apr 2021 21:12:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7379F5C67A;
	Mon, 26 Apr 2021 21:12:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BA664EA30;
	Mon, 26 Apr 2021 21:12:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13QLAvft029466 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 26 Apr 2021 17:10:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCEF410016FD; Mon, 26 Apr 2021 21:10:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast01.extmail.prod.ext.phx2.redhat.com [10.5.110.50])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D723D10074F1
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 21:10:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAA45100A62B
	for <linux-cachefs@redhat.com>; Mon, 26 Apr 2021 21:10:44 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-218-ZV7IHVgROFmpOEQW1XjzPA-1; Mon, 26 Apr 2021 17:10:42 -0400
X-MC-Unique: ZV7IHVgROFmpOEQW1XjzPA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lb8U7-0066Gp-Tn; Mon, 26 Apr 2021 21:09:41 +0000
Date: Mon, 26 Apr 2021 22:09:39 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210426210939.GS235567@casper.infradead.org>
References: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
	<3726642.1619471184@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <3726642.1619471184@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 26 Apr 2021 17:12:14 -0400
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Mike Marshall <hubcap@omnibond.com>
Subject: Re: [Linux-cachefs] [PATCH] netfs: Miscellaneous fixes
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

On Mon, Apr 26, 2021 at 10:06:24PM +0100, David Howells wrote:
> @@ -968,7 +968,7 @@ int netfs_readpage(struct file *file,
>  		return -ENOMEM;
>  	}
>  	rreq->mapping	= page_file_mapping(page);
> -	rreq->start	= page_index(page) * PAGE_SIZE;
> +	rreq->start	= page_offset(page);

This one needs to use page_file_offset() because swap-over-NFS.

> @@ -1105,8 +1105,8 @@ int netfs_write_begin(struct file *file, struct address_space *mapping,
>  	rreq = netfs_alloc_read_request(ops, netfs_priv, file);
>  	if (!rreq)
>  		goto error;
> -	rreq->mapping		= page->mapping;
> -	rreq->start		= page->index * PAGE_SIZE;
> +	rreq->mapping		= page_file_mapping(page);

There's nothing wrong with using page->mapping here.  The swap-over-NFS
path doesn't use write_begin, it uses O_DIRECT writes.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

