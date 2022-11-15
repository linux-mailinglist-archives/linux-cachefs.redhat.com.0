Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D70D0628E66
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Nov 2022 01:31:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668472299;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=11ivQQSj1u7UI1dGntsdhIgSfSMGWtSL3FR7YvPUF6s=;
	b=h6CG8LvcrrL6wx2AkTpWgIQH48RNbBww//peYFqsnGW6Cgl2rqO+L9Bh+MLG5U6HfMB48g
	CvkG5fwKrn06N2kq6q/LZMTSvOVOOJQ6onJtKOz5FKa5xddQ5WvkLSEWTxvkQ0CF75j63Q
	uZAPkqyoDWAH7BqARq/MPfMYXOoaAXY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-NFwqirjgOCOVpCrunDBPMg-1; Mon, 14 Nov 2022 19:31:38 -0500
X-MC-Unique: NFwqirjgOCOVpCrunDBPMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2DF4101A54E;
	Tue, 15 Nov 2022 00:31:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC47C1121333;
	Tue, 15 Nov 2022 00:31:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 87EC1194658F;
	Tue, 15 Nov 2022 00:31:36 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 479181946589 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 15 Nov 2022 00:31:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 33A9640E978A; Tue, 15 Nov 2022 00:31:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C20340E9789
 for <linux-cachefs@redhat.com>; Tue, 15 Nov 2022 00:31:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 111BB3C0F663
 for <linux-cachefs@redhat.com>; Tue, 15 Nov 2022 00:31:35 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-84XXIAL5OhOz4AjJkHFq0A-1; Mon, 14 Nov 2022 19:31:29 -0500
X-MC-Unique: 84XXIAL5OhOz4AjJkHFq0A-1
Received: by nautica.notk.org (Postfix, from userid 108)
 id 18B47C020; Tue, 15 Nov 2022 01:22:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on nautica.notk.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=UNPARSEABLE_RELAY
 autolearn=unavailable version=3.3.2
Received: from odin.codewreck.org (localhost [127.0.0.1])
 by nautica.notk.org (Postfix) with ESMTPS id E9DB3C009;
 Tue, 15 Nov 2022 01:22:41 +0100 (CET)
Received: from localhost (odin.codewreck.org [local])
 by odin.codewreck.org (OpenSMTPD) with ESMTPA id 675ffca7;
 Tue, 15 Nov 2022 00:22:33 +0000 (UTC)
Date: Tue, 15 Nov 2022 09:22:18 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <Y3Lbul7FZncNVwVZ@codewreck.org>
References: <166844174069.1124521.10890506360974169994.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <166844174069.1124521.10890506360974169994.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [RFC PATCH v2] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 Steve French <sfrench@samba.org>, linux-mm@kvack.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells wrote on Mon, Nov 14, 2022 at 04:02:20PM +0000:
> Fscache has an optimisation by which reads from the cache are skipped until
> we know that (a) there's data there to be read and (b) that data isn't
> entirely covered by pages resident in the netfs pagecache.  This is done
> with two flags manipulated by fscache_note_page_release():
> 
> 	if (...
> 	    test_bit(FSCACHE_COOKIE_HAVE_DATA, &cookie->flags) &&
> 	    test_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags))
> 		clear_bit(FSCACHE_COOKIE_NO_DATA_TO_READ, &cookie->flags);
> 
> where the NO_DATA_TO_READ flag causes cachefiles_prepare_read() to indicate
> that netfslib should download from the server or clear the page instead.
> 
> The fscache_note_page_release() function is intended to be called from
> ->releasepage() - but that only gets called if PG_private or PG_private_2
> is set - and currently the former is at the discretion of the network
> filesystem and the latter is only set whilst a page is being written to the
> cache, so sometimes we miss clearing the optimisation.
> 
> Fix this by following Willy's suggestion[1] and adding an address_space
> flag, AS_RELEASE_ALWAYS, that causes filemap_release_folio() to always call
> ->release_folio() if it's set, even if PG_private or PG_private_2 aren't
> set.

Not familiar with the common code so just glanced at it and asked stupid
questions.

> diff --git a/fs/9p/cache.c b/fs/9p/cache.c
> index cebba4eaa0b5..12c0ae29f185 100644
> --- a/fs/9p/cache.c
> +++ b/fs/9p/cache.c
> @@ -68,6 +68,8 @@ void v9fs_cache_inode_get_cookie(struct inode *inode)
>  				       &path, sizeof(path),
>  				       &version, sizeof(version),
>  				       i_size_read(&v9inode->netfs.inode));
> +	if (v9inode->netfs.cache)
> +		mapping_set_release_always(inode->i_mapping);
>  
>  	p9_debug(P9_DEBUG_FSC, "inode %p get cookie %p\n",
>  		 inode, v9fs_inode_cookie(v9inode));
> diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
> index 4d1a4a8d9277..b553fe3484c1 100644
> --- a/fs/9p/vfs_inode.c
> +++ b/fs/9p/vfs_inode.c
> @@ -394,6 +394,7 @@ void v9fs_evict_inode(struct inode *inode)
>  	version = cpu_to_le32(v9inode->qid.version);
>  	fscache_clear_inode_writeback(v9fs_inode_cookie(v9inode), inode,
>  				      &version);
> +	mapping_clear_release_always(inode->i_mapping);

any harm in setting this if netfs isn't enabled?
(just asking because you checked in fs/9p/cache.c above)

>  	clear_inode(inode);
>  	filemap_fdatawrite(&inode->i_data);
>  
> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index bbccb4044222..3db9a6225bc0 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -199,6 +199,7 @@ enum mapping_flags {
>  	/* writeback related tags are not used */
>  	AS_NO_WRITEBACK_TAGS = 5,
>  	AS_LARGE_FOLIO_SUPPORT = 6,
> +	AS_RELEASE_ALWAYS,	/* Call ->release_folio(), even if no private data */
>  };
>  
>  /**
> @@ -269,6 +270,21 @@ static inline int mapping_use_writeback_tags(struct address_space *mapping)
>  	return !test_bit(AS_NO_WRITEBACK_TAGS, &mapping->flags);
>  }
>  
> +static inline bool mapping_release_always(const struct address_space *mapping)
> +{
> +	return test_bit(AS_RELEASE_ALWAYS, &mapping->flags);
> +}
> +
> +static inline void mapping_set_release_always(struct address_space *mapping)
> +{
> +	set_bit(AS_RELEASE_ALWAYS, &mapping->flags);
> +}
> +
> +static inline void mapping_clear_release_always(struct address_space *mapping)
> +{
> +	set_bit(AS_RELEASE_ALWAYS, &mapping->flags);

clear_bit certainly?

> +}
> +
>  static inline gfp_t mapping_gfp_mask(struct address_space * mapping)
>  {
>  	return mapping->gfp_mask;
> diff --git a/mm/truncate.c b/mm/truncate.c
> index c0be77e5c008..0d4dd233f518 100644
> --- a/mm/truncate.c
> +++ b/mm/truncate.c
> @@ -19,7 +19,6 @@
>  #include <linux/highmem.h>
>  #include <linux/pagevec.h>
>  #include <linux/task_io_accounting_ops.h>
> -#include <linux/buffer_head.h>	/* grr. try_to_release_page */
>  #include <linux/shmem_fs.h>
>  #include <linux/rmap.h>
>  #include "internal.h"
> @@ -276,7 +275,7 @@ static long mapping_evict_folio(struct address_space *mapping,
>  	if (folio_ref_count(folio) >
>  			folio_nr_pages(folio) + folio_has_private(folio) + 1)
>  		return 0;
> -	if (folio_has_private(folio) && !filemap_release_folio(folio, 0))
> +	if (!filemap_release_folio(folio, 0))

should this (and all others) check for folio_needs_release instead of has_private?
filemap_release_folio doesn't check as far as I can see, but perhaps
it's already fast and noop for another reason I didn't see.

>  		return 0;
>  
>  	return remove_mapping(mapping, folio);

--
Dominique

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

