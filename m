Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D14E48D096
	for <lists+linux-cachefs@lfdr.de>; Thu, 13 Jan 2022 03:56:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-u4whFPY5M7eOyMwOl38zlA-1; Wed, 12 Jan 2022 21:56:36 -0500
X-MC-Unique: u4whFPY5M7eOyMwOl38zlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A48323482F;
	Thu, 13 Jan 2022 02:56:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 872355BE08;
	Thu, 13 Jan 2022 02:56:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C4CA84BB7C;
	Thu, 13 Jan 2022 02:56:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20D2sOBm010845 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 21:54:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BB95A53CF; Thu, 13 Jan 2022 02:54:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B67E753D4
	for <linux-cachefs@redhat.com>; Thu, 13 Jan 2022 02:54:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B72813C02B88
	for <linux-cachefs@redhat.com>; Thu, 13 Jan 2022 02:54:21 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
	(out30-43.freemail.mail.aliyun.com [115.124.30.43]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-282-KPxsfC7VPtSwJMSVggcSOA-1; Wed, 12 Jan 2022 21:54:17 -0500
X-MC-Unique: KPxsfC7VPtSwJMSVggcSOA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0V1hGTZ0_1642042452
Received: from 30.225.24.62(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V1hGTZ0_1642042452) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 13 Jan 2022 10:54:13 +0800
Message-ID: <b274b05b-db23-2b11-c347-fbfe3de0917d@linux.alibaba.com>
Date: Thu, 13 Jan 2022 10:54:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.2
To: David Howells <dhowells@redhat.com>
References: <20211228124419.103020-1-jefflexu@linux.alibaba.com>
	<693ab77bab10b38b1ddab373211c24722e79fee2.camel@kernel.org>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <693ab77bab10b38b1ddab373211c24722e79fee2.camel@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: idryomov@gmail.com, linux-cachefs@redhat.com,
	Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: make ops->init_rreq() optional
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

ping...


On 1/7/22 5:49 AM, Jeff Layton wrote:
> 
> This looks reasonable to me, since ceph doesn't need anything here
> anyway.
> 
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> 

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

