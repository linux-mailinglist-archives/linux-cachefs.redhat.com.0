Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6C746BC38
	for <lists+linux-cachefs@lfdr.de>; Tue,  7 Dec 2021 14:14:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-0tZTfRyTMfuKNcjwe42vwQ-1; Tue, 07 Dec 2021 08:14:35 -0500
X-MC-Unique: 0tZTfRyTMfuKNcjwe42vwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9032F64A7A;
	Tue,  7 Dec 2021 13:14:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C0575FC13;
	Tue,  7 Dec 2021 13:14:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 534EB4BB7C;
	Tue,  7 Dec 2021 13:14:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B7DDv9X009106 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 7 Dec 2021 08:13:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E3E7C492CA3; Tue,  7 Dec 2021 13:13:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF23E492C3B
	for <linux-cachefs@redhat.com>; Tue,  7 Dec 2021 13:13:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA28C85A5AA
	for <linux-cachefs@redhat.com>; Tue,  7 Dec 2021 13:13:56 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-580-j6oP4WQzOb-DFmP1zaZsrA-1; Tue, 07 Dec 2021 08:13:53 -0500
X-MC-Unique: j6oP4WQzOb-DFmP1zaZsrA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1muaI2-007Mhh-NU; Tue, 07 Dec 2021 13:13:51 +0000
Date: Tue, 7 Dec 2021 13:13:50 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <Ya9eDiFCE2fO7K/S@casper.infradead.org>
References: <163887597541.1596626.2668163316598972956.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <163887597541.1596626.2668163316598972956.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, jlayton@kernel.org, linux-cachefs@redhat.com,
	jack@suse.cz, linux-kernel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: Fix lockdep warning from taking
 sb_writers whilst holding mmap_lock
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

On Tue, Dec 07, 2021 at 11:19:35AM +0000, David Howells wrote:
> Taking sb_writers whilst holding mmap_lock isn't allowed and will result in
> a lockdep warning like that below.  The problem comes from cachefiles
> needing to take the sb_writers lock in order to do a write to the cache,
> but being asked to do this by netfslib called from readpage, readahead or
> write_begin[1].

Isn't it taking sb_writers _on a different filesystem_?  So there's not
a real deadlock here, just a need to tell lockdep that this is a
different subclass of lock?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

