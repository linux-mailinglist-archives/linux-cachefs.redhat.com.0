Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5774B66E2
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Feb 2022 10:03:42 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-cW9MQIVIO_-Yt8pkQrYunQ-1; Tue, 15 Feb 2022 04:03:38 -0500
X-MC-Unique: cW9MQIVIO_-Yt8pkQrYunQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB70E1091DA2;
	Tue, 15 Feb 2022 09:03:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B73555F7E;
	Tue, 15 Feb 2022 09:03:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 196E41809C88;
	Tue, 15 Feb 2022 09:03:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21F93QLT005675 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 15 Feb 2022 04:03:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D60DB5361D9; Tue, 15 Feb 2022 09:03:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D201C5361C5
	for <linux-cachefs@redhat.com>; Tue, 15 Feb 2022 09:03:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8C10811E84
	for <linux-cachefs@redhat.com>; Tue, 15 Feb 2022 09:03:26 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
	(out30-131.freemail.mail.aliyun.com [115.124.30.131]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-481-5PAFvm49OwuAgfbk3J0oqA-1; Tue, 15 Feb 2022 04:03:22 -0500
X-MC-Unique: 5PAFvm49OwuAgfbk3J0oqA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V4Xi.eo_1644915796
Received: from 30.225.24.85(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V4Xi.eo_1644915796) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 15 Feb 2022 17:03:17 +0800
Message-ID: <bd9cb3bb-e29c-d4b3-e9bf-915b9771b553@linux.alibaba.com>
Date: Tue, 15 Feb 2022 17:03:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.6.0
From: JeffleXu <jefflexu@linux.alibaba.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org
References: <20220209060108.43051-1-jefflexu@linux.alibaba.com>
	<20220209060108.43051-6-jefflexu@linux.alibaba.com>
In-Reply-To: <20220209060108.43051-6-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	willy@infradead.org, joseph.qi@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, gerry@linux.alibaba.com,
	torvalds@linux-foundation.org
Subject: Re: [Linux-cachefs] [PATCH v3 05/22] cachefiles: introduce new
 devnode for on-demand read mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

FYI I've updated this patch on [1].

[1]
https://github.com/lostjeffle/linux/commit/589dd838dc539aee291d1032406653a8f6269e6f.

This new version mainly adds cachefiles_ondemand_flush_reqs(), which
drains the pending read requests when cachefilesd is going to exit.

On 2/9/22 2:00 PM, Jeffle Xu wrote:
> This patch introduces a new devnode 'cachefiles_ondemand' to support the
> newly introduced on-demand read mode.
> 
> The precondition for on-demand reading semantics is that, all blob files
> have been placed under corresponding directory with correct file size
> (sparse files) on the first beginning. When upper fs starts to access
> the blob file, it will "cache miss" (hit the hole) and then turn to user
> daemon for preparing the data.
> 
> The interaction between kernel and user daemon is described as below.
> 1. Once cache miss, .ondemand_read() callback of corresponding fscache
>    backend is called to prepare the data. As for cachefiles, it just
>    packages related metadata (file range to read, etc.) into a pending
>    read request, and then the process triggering cache miss will fall
>    asleep until the corresponding data gets fetched later.
> 2. User daemon needs to poll on the devnode ('cachefiles_ondemand'),
>    waiting for pending read request.
> 3. Once there's pending read request, user daemon will be notified and
>    shall read the devnode ('cachefiles_ondemand') to fetch one pending
>    read request to process.
> 4. For the fetched read request, user daemon need to somehow prepare the
>    data (e.g. download from remote through network) and then write the
>    fetched data into the backing file to fill the hole.
> 5. After that, user daemon need to notify cachefiles backend by writing a
>    'done' command to devnode ('cachefiles_ondemand'). It will also
>    awake the previous asleep process triggering cache miss.
> 6. By the time the process gets awaken, the data has been ready in the
>    backing file. Then process can re-initiate a read request from the
>    backing file.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---


-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

