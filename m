Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 901095215E3
	for <lists+linux-cachefs@lfdr.de>; Tue, 10 May 2022 14:50:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652187025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oQnZXAVTUgoedbY5/YUZaBSAgr5xO8nLzG8hYt7jkKE=;
	b=iA4mhp/MgGCqo9gxmxESp62TBlMTk9fvHzOffco+3qEfJTVSmyfBua5wQeFZxeJWd3NSYD
	1qxMZ5Mv5jXmmpXThdTVsU7g25ZZc5bsutW+pMrYEPwGSni9lUSKEB5AKMGB01RNGUohJU
	Ok6ypGlDtL3ithSNG9D4q1faXjD8iNk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-lemfm70lO3yK3Chm4vgaeA-1; Tue, 10 May 2022 08:50:22 -0400
X-MC-Unique: lemfm70lO3yK3Chm4vgaeA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 220A0811E7A;
	Tue, 10 May 2022 12:50:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33DFE40CFD06;
	Tue, 10 May 2022 12:50:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EFA33194705D;
	Tue, 10 May 2022 12:50:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 95DB41947052 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 10 May 2022 12:50:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1E3C914C1D50; Tue, 10 May 2022 12:50:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 483D714C1D4D;
 Tue, 10 May 2022 12:50:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220509074028.74954-3-jefflexu@linux.alibaba.com>
References: <20220509074028.74954-3-jefflexu@linux.alibaba.com>
 <20220509074028.74954-1-jefflexu@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Tue, 10 May 2022 13:50:15 +0100
Message-ID: <3509081.1652187015@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v11 02/22] cachefiles: notify the user
 daemon when looking up cookie
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
Cc: zhujia.zj@bytedance.com, tianzichen@kuaishou.com,
 linux-erofs@lists.ozlabs.org, chao@kernel.org, tao.peng@linux.alibaba.com,
 willy@infradead.org, linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 zhangjiachen.jaycee@bytedance.com, linux-cachefs@redhat.com,
 bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com, yinxin.x@bytedance.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3509080.1652187015.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeffle Xu <jefflexu@linux.alibaba.com> wrote:

> Fscache/CacheFiles used to serve as a local cache for a remote
> networking fs. A new on-demand read mode will be introduced for
> CacheFiles, which can boost the scenario where on-demand read semantics
> are needed, e.g. container image distribution.
> 
> The essential difference between these two modes is seen when a cache
> miss occurs: In the original mode, the netfs will fetch the data from
> the remote server and then write it to the cache file; in on-demand
> read mode, fetching the data and writing it into the cache is delegated
> to a user daemon.
> 
> As the first step, notify the user daemon when looking up cookie. In
> this case, an anonymous fd is sent to the user daemon, through which the
> user daemon can write the fetched data to the cache file. Since the user
> daemon may move the anonymous fd around, e.g. through dup(), an object
> ID uniquely identifying the cache file is also attached.
> 
> Also add one advisory flag (FSCACHE_ADV_WANT_CACHE_SIZE) suggesting that
> the cache file size shall be retrieved at runtime. This helps the
> scenario where one cache file contains multiple netfs files, e.g. for
> the purpose of deduplication. In this case, netfs itself has no idea the
> size of the cache file, whilst the user daemon should give the hint on
> it.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

Acked-by: David Howells <dhowells@redhat.com>
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

