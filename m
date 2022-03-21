Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A1D4E2A90
	for <lists+linux-cachefs@lfdr.de>; Mon, 21 Mar 2022 15:26:23 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-yd4sseq9OKOQq2zNYPhtwA-1; Mon, 21 Mar 2022 10:26:19 -0400
X-MC-Unique: yd4sseq9OKOQq2zNYPhtwA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11800380390C;
	Mon, 21 Mar 2022 14:26:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A6BF401DBB;
	Mon, 21 Mar 2022 14:26:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1D0D51947BBE;
	Mon, 21 Mar 2022 14:26:18 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C7B2219451ED for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 21 Mar 2022 14:26:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B4AF71121321; Mon, 21 Mar 2022 14:26:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B05951121319
 for <linux-cachefs@redhat.com>; Mon, 21 Mar 2022 14:26:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 877403803900
 for <linux-cachefs@redhat.com>; Mon, 21 Mar 2022 14:26:14 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-QILZHtWwMWOVe6aT0d1gPg-1; Mon, 21 Mar 2022 10:26:13 -0400
X-MC-Unique: QILZHtWwMWOVe6aT0d1gPg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nWIz2-00AeF9-B8; Mon, 21 Mar 2022 14:26:08 +0000
Date: Mon, 21 Mar 2022 14:26:08 +0000
From: Matthew Wilcox <willy@infradead.org>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <YjiLACenpRV4XTcs@casper.infradead.org>
References: <20220316131723.111553-1-jefflexu@linux.alibaba.com>
 <20220316131723.111553-4-jefflexu@linux.alibaba.com>
 <YjiAVezd5B9auhcP@casper.infradead.org>
 <6bc551d2-15fc-5d17-c99b-8db588c6b671@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <6bc551d2-15fc-5d17-c99b-8db588c6b671@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Cc: linux-erofs@lists.ozlabs.org, chao@kernel.org, tao.peng@linux.alibaba.com,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
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

On Mon, Mar 21, 2022 at 10:08:47PM +0800, JeffleXu wrote:
> reqs_lock is also used to protect the check of cache->flags. Please
> refer to patch 4 [1] of this patchset.

Yes, that's exactly what I meant by "bad idea".

> ```
> +	/*
> +	 * Enqueue the pending request.
> +	 *
> +	 * Stop enqueuing the request when daemon is dying. So we need to
> +	 * 1) check cache state, and 2) enqueue request if cache is alive.
> +	 *
> +	 * The above two ops need to be atomic as a whole. @reqs_lock is used
> +	 * here to ensure that. Otherwise, request may be enqueued after xarray
> +	 * has been flushed, in which case the orphan request will never be
> +	 * completed and thus netfs will hang there forever.
> +	 */
> +	read_lock(&cache->reqs_lock);
> +
> +	/* recheck dead state under lock */
> +	if (test_bit(CACHEFILES_DEAD, &cache->flags)) {
> +		read_unlock(&cache->reqs_lock);
> +		ret = -EIO;
> +		goto out;
> +	}

So this is an error path.  We're almost always going to take the xa_lock
immediately after taking the read_lock.  In other words, you've done two
atomic operations instead of one.

> +	xa_lock(xa);
> +	ret = __xa_alloc(xa, &id, req, xa_limit_32b, GFP_KERNEL);
> +	if (!ret)
> +		__xa_set_mark(xa, id, CACHEFILES_REQ_NEW);
> +	xa_unlock(xa);
> +
> +	read_unlock(&cache->reqs_lock);
> ```
> 
> It's mainly used to protect against the xarray flush.
> 
> Besides, IMHO read-write lock shall be more performance friendly, since
> most cases are the read side.

That's almost never true.  rwlocks are usually a bad idea because you
still have to bounce the cacheline, so you replace lock contention
(which you can see) with cacheline contention (which is harder to
measure).  And then you have questions about reader/writer fairness
(should new readers queue behind a writer if there's one waiting, or
should a steady stream of readers be able to hold a writer off
indefinitely?)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

