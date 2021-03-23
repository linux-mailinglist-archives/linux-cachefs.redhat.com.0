Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9E69E346029
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 14:52:02 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-KvDySCXpNGWtOiQi3ChPsw-1; Tue, 23 Mar 2021 09:51:59 -0400
X-MC-Unique: KvDySCXpNGWtOiQi3ChPsw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E65658143F2;
	Tue, 23 Mar 2021 13:51:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE4655D9C0;
	Tue, 23 Mar 2021 13:51:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB54A4BB7C;
	Tue, 23 Mar 2021 13:51:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NDpWmE005038 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 09:51:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E810E2026D60; Tue, 23 Mar 2021 13:51:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1F9D2026D6B
	for <linux-cachefs@redhat.com>; Tue, 23 Mar 2021 13:51:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B43D1100DE7C
	for <linux-cachefs@redhat.com>; Tue, 23 Mar 2021 13:51:29 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-297-6UVU42LLNDubCFUYzX7wmg-1; Tue, 23 Mar 2021 09:51:27 -0400
X-MC-Unique: 6UVU42LLNDubCFUYzX7wmg-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lOhRE-00A7tp-Gh; Tue, 23 Mar 2021 13:51:19 +0000
Date: Tue, 23 Mar 2021 13:51:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210323135116.GF1719932@casper.infradead.org>
References: <1885296.1616410586@warthog.procyon.org.uk>
	<20210321105309.GG3420@casper.infradead.org>
	<161539526152.286939.8589700175877370401.stgit@warthog.procyon.org.uk>
	<161539528910.286939.1252328699383291173.stgit@warthog.procyon.org.uk>
	<2499407.1616505440@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <2499407.1616505440@warthog.procyon.org.uk>
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
	linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [PATCH v4 02/28] mm: Add an unlock function for
 PG_private_2/PG_fscache
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

On Tue, Mar 23, 2021 at 01:17:20PM +0000, David Howells wrote:
> +++ b/fs/afs/write.c
> @@ -846,7 +846,7 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
>  	 */
>  #ifdef CONFIG_AFS_FSCACHE
>  	if (PageFsCache(page) &&
> -	    wait_on_page_bit_killable(page, PG_fscache) < 0)
> +	    wait_on_page_fscache_killable(page) < 0)
>  		return VM_FAULT_RETRY;
>  #endif
>  
> @@ -861,7 +861,8 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
>  	 * details the portion of the page we need to write back and we might
>  	 * need to redirty the page if there's a problem.
>  	 */
> -	wait_on_page_writeback(page);
> +	if (wait_on_page_writeback_killable(page) < 0)
> +		return VM_FAULT_RETRY | VM_FAULT_LOCKED;

You forgot to unlock the page.  Also, if you're waiting killably here,
do you need to wait before you get the page lock?  Ditto for waiting on
fscache -- do you want to do that before or after you get the page lock?

Also, I never quite understood why you needed to wait for fscache
writes to finish before allowing the page to be dirtied.  Is this a
wait_for_stable_page() kind of situation, where the cache might be
calculating a checksum on it?  Because as far as I can tell, once the
page is dirty in RAM, the contents of the on-disk cache are irrelevant ...
unless they're part of a RAID 5 checksum kind of situation.

I didn't spot any other problems ...

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

