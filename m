Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 058FF4E44A5
	for <lists+linux-cachefs@lfdr.de>; Tue, 22 Mar 2022 18:04:56 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-4dM3SkxZP0ur22C_kJE_nA-1; Tue, 22 Mar 2022 13:04:52 -0400
X-MC-Unique: 4dM3SkxZP0ur22C_kJE_nA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06B61101EA64;
	Tue, 22 Mar 2022 17:04:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D0EC401DAE;
	Tue, 22 Mar 2022 17:04:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D530A1940345;
	Tue, 22 Mar 2022 17:04:48 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A8A3C1947BBC for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 22 Mar 2022 17:04:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 80079C202CA; Tue, 22 Mar 2022 17:04:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BF80C15D4F
 for <linux-cachefs@redhat.com>; Tue, 22 Mar 2022 17:04:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A0BD801E67
 for <linux-cachefs@redhat.com>; Tue, 22 Mar 2022 17:04:47 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216--LnLT9JvMS2F9svhD0nqzQ-1; Tue, 22 Mar 2022 13:04:45 -0400
X-MC-Unique: -LnLT9JvMS2F9svhD0nqzQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nWhvy-00BmKW-HY; Tue, 22 Mar 2022 17:04:38 +0000
Date: Tue, 22 Mar 2022 17:04:38 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <YjoBpm8mUHX/w/rK@casper.infradead.org>
References: <YjiX5oXYkmN6WrA3@casper.infradead.org>
 <20220316131723.111553-1-jefflexu@linux.alibaba.com>
 <20220316131723.111553-4-jefflexu@linux.alibaba.com>
 <YjiAVezd5B9auhcP@casper.infradead.org>
 <6bc551d2-15fc-5d17-c99b-8db588c6b671@linux.alibaba.com>
 <YjiLACenpRV4XTcs@casper.infradead.org>
 <adb957da-8909-06d8-1b2c-b8a293b37930@linux.alibaba.com>
 <1035025.1647876652@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <1035025.1647876652@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v5 03/22] cachefiles: introduce
 on-demand read mode
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
Cc: joseph.qi@linux.alibaba.com, linux-erofs@lists.ozlabs.org, chao@kernel.org,
 tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 luodaowen.backend@bytedance.com, xiang@kernel.org, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org, eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 21, 2022 at 03:30:52PM +0000, David Howells wrote:
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > Absolutely; just use xa_lock() to protect both setting & testing the
> > flag.
> 
> How should Jeffle deal with xarray dropping the lock internally in order to do
> an allocation and then taking it again (actually in patch 5)?

There are a number of ways to handle this.  I'll outline two; others
are surely possible.

option 1:

add side:

xa_lock();
if (!DEAD)
	xa_store(GFP_KERNEL);
	if (DEAD)
		xa_erase();
xa_unlock();

destroy side:

xa_lock();
set DEAD;
xa_for_each()
	xa_erase();
xa_unlock();

That has the problem (?) that it might be temporarily possible to see
a newly-added entry in a DEAD array.

If that is a problem, you can use xa_reserve() on the add side, followed
by overwriting it or removing it, depending on the state of the DEAD flag.

If you really want to, you can decompose the add side so that you always
check the DEAD flag before doing the store, ie:

do {
	xas_lock();
	if (DEAD)
		xas_set_error(-EINVAL);
	else
		xas_store();
	xas_unlock();
} while (xas_nomem(GFP_KERNEL));

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

