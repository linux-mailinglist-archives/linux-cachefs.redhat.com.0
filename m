Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2790A345DC9
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 13:10:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-Oyl0B7kwOwS7DqSDV0X78g-1; Tue, 23 Mar 2021 08:10:15 -0400
X-MC-Unique: Oyl0B7kwOwS7DqSDV0X78g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77ABF801817;
	Tue, 23 Mar 2021 12:10:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E4E61001281;
	Tue, 23 Mar 2021 12:10:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A6671809C83;
	Tue, 23 Mar 2021 12:10:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NCA86T027421 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 08:10:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A2472166B44; Tue, 23 Mar 2021 12:10:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11FC221CAC6F
	for <linux-cachefs@redhat.com>; Tue, 23 Mar 2021 12:10:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 829A7805F4A
	for <linux-cachefs@redhat.com>; Tue, 23 Mar 2021 12:10:04 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-88-_2FHTTpuMFChPEaLtbp7PA-1; Tue, 23 Mar 2021 08:10:00 -0400
X-MC-Unique: _2FHTTpuMFChPEaLtbp7PA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lOfpl-00A1WB-Ek; Tue, 23 Mar 2021 12:09:04 +0000
Date: Tue, 23 Mar 2021 12:08:29 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210323120829.GC1719932@casper.infradead.org>
References: <161650040278.2445805.7652115256944270457.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161650040278.2445805.7652115256944270457.stgit@warthog.procyon.org.uk>
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
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH 0/3] cachefiles, afs: mm wait fixes
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

On Tue, Mar 23, 2021 at 11:53:22AM +0000, David Howells wrote:
> 
> Here are some patches to fix page waiting-related issues in cachefiles and
> afs[1]:
> 
>  (1) In cachefiles, remove the use of the wait_bit_key struct to access
>      something that's actually in wait_page_key format.  The proper struct
>      is now available in the header, so that should be used instead.
> 
>  (2) Add a proper wait function for waiting killably on the page writeback
>      flag.  This includes a recent bugfix here (presumably commit
>      c2407cf7d22d0c0d94cf20342b3b8f06f1d904e7).
> 
>  (3) In afs, use the function added in (2) rather than using
>      wait_on_page_bit_killable() which doesn't have the aforementioned
>      bugfix.
> 
>      Note that I modified this to work with the upstream code where the
>      page pointer isn't cached in a local variable.

Thanks, the minor modifications to the patches (changelogs, fixes to apply
to upstream) all look good to me.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

