Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D294A480923
	for <lists+linux-cachefs@lfdr.de>; Tue, 28 Dec 2021 13:34:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-OIK-NWiNNVWSnflyL-050g-1; Tue, 28 Dec 2021 07:34:53 -0500
X-MC-Unique: OIK-NWiNNVWSnflyL-050g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C5BB1006AA3;
	Tue, 28 Dec 2021 12:34:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5DE722E12;
	Tue, 28 Dec 2021 12:34:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B4361809C87;
	Tue, 28 Dec 2021 12:34:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BSCYfo3029848 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 28 Dec 2021 07:34:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 80C33515995; Tue, 28 Dec 2021 12:34:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CDA9515980
	for <linux-cachefs@redhat.com>; Tue, 28 Dec 2021 12:34:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3539C2BD19E3
	for <linux-cachefs@redhat.com>; Tue, 28 Dec 2021 12:34:41 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
	(out30-42.freemail.mail.aliyun.com [115.124.30.42]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-55-MajRCJFWOKOErdF4phj7pw-1; Tue, 28 Dec 2021 07:34:37 -0500
X-MC-Unique: MajRCJFWOKOErdF4phj7pw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R861e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
	TI=SMTPD_---0V06peAr_1640694869
Received: from 30.225.24.30(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V06peAr_1640694869) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 28 Dec 2021 20:34:30 +0800
Message-ID: <de5dfac5-9c33-a4e2-e5f1-39547a409fd0@linux.alibaba.com>
Date: Tue, 28 Dec 2021 20:34:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.2
To: Joseph Qi <joseph.qi@linux.alibaba.com>, dhowells@redhat.com,
	linux-cachefs@redhat.com, xiang@kernel.org, chao@kernel.org,
	linux-erofs@lists.ozlabs.org
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-2-jefflexu@linux.alibaba.com>
	<d066131d-1bcb-e64d-a10b-b3dbb4506b96@linux.alibaba.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <d066131d-1bcb-e64d-a10b-b3dbb4506b96@linux.alibaba.com>
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
Cc: tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	eguan@linux.alibaba.com, gerry@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v1 01/23] cachefiles: add
	cachefiles_demand devnode
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 12/28/21 10:47 AM, Joseph Qi wrote:

> 
> Better to prepare the on-demand read() and poll() first, and then add
> the on-demand cachefiles dev.
> 

Regards. Thanks.

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

