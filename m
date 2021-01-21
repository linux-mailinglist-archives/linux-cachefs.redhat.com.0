Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 70B092FEBF4
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Jan 2021 14:34:47 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-oFb26AtFNXWt2XB3fUnRvg-1; Thu, 21 Jan 2021 08:34:44 -0500
X-MC-Unique: oFb26AtFNXWt2XB3fUnRvg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 333E48030A0;
	Thu, 21 Jan 2021 13:34:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F0E919C46;
	Thu, 21 Jan 2021 13:34:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E65434BB40;
	Thu, 21 Jan 2021 13:34:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LDYWaE007081 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 08:34:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6FE9F2026D3B; Thu, 21 Jan 2021 13:34:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A2482026D25
	for <linux-cachefs@redhat.com>; Thu, 21 Jan 2021 13:34:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7399D100FBCC
	for <linux-cachefs@redhat.com>; Thu, 21 Jan 2021 13:34:29 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-568-ge8JoNt4NxCBZsO1BojXgw-1; Thu, 21 Jan 2021 08:34:24 -0500
X-MC-Unique: ge8JoNt4NxCBZsO1BojXgw-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1l2a6A-00H6A7-4n; Thu, 21 Jan 2021 13:34:08 +0000
Date: Thu, 21 Jan 2021 13:34:06 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210121133406.GP2260413@casper.infradead.org>
References: <161118128472.1232039.11746799833066425131.stgit@warthog.procyon.org.uk>
	<161118129703.1232039.17141248432017826976.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <161118129703.1232039.17141248432017826976.stgit@warthog.procyon.org.uk>
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
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH 01/25] iov_iter: Add ITER_XARRAY
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jan 20, 2021 at 10:21:37PM +0000, David Howells wrote:
> -#define iterate_all_kinds(i, n, v, I, B, K) {			\
> +#define iterate_all_kinds(i, n, v, I, B, K, X) {		\

Do you need to add the X parameter?  It seems to always be the same as B.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

