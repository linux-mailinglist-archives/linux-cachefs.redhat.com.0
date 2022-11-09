Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6163622375
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Nov 2022 06:35:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667972145;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yE8iyaS01Gtb24iokW/UrK8BN9J+F1gvWgy4WAfWkQE=;
	b=M6178zB4D/iuB25eyV30cB7tTP/k9E+p6Uz7LrtAiCXHuXej3I2D/E32SOyqwAX9u6wTER
	tbaaKkiAh1DHpHJDuIr7UfQpZuG8nYvx1R+Y+ljiBg3JAg3bGSKh0mZ23oFfZs3/n6BU4W
	V7C6X3nasDME6/bzJ8omkw27IclFPFE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-vKLBgVooNcmYxKSKSAME4Q-1; Wed, 09 Nov 2022 00:35:39 -0500
X-MC-Unique: vKLBgVooNcmYxKSKSAME4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03CDD1C075A6;
	Wed,  9 Nov 2022 05:35:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FA40140EBF3;
	Wed,  9 Nov 2022 05:35:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 285921946597;
	Wed,  9 Nov 2022 05:35:36 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 59A811946588 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Nov 2022 05:35:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3D326492B16; Wed,  9 Nov 2022 05:35:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3597F492B05
 for <linux-cachefs@redhat.com>; Wed,  9 Nov 2022 05:35:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A783101A52A
 for <linux-cachefs@redhat.com>; Wed,  9 Nov 2022 05:35:35 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-611-m79wbasNNea_ydREn5gXDQ-1; Wed, 09 Nov 2022 00:35:30 -0500
X-MC-Unique: m79wbasNNea_ydREn5gXDQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VUMLLG8_1667972125
Received: from 30.221.129.114(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VUMLLG8_1667972125) by smtp.aliyun-inc.com;
 Wed, 09 Nov 2022 13:35:26 +0800
Message-ID: <af8490c5-524c-69a8-d128-d0c70a3deb76@linux.alibaba.com>
Date: Wed, 9 Nov 2022 13:35:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: David Howells <dhowells@redhat.com>, willy@infradead.org
References: <166757987929.950645.12595273010425381286.stgit@warthog.procyon.org.uk>
 <166757988611.950645.7626959069846893164.stgit@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <166757988611.950645.7626959069846893164.stgit@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v2 2/2] netfs: Fix dodgy maths
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 11/5/22 12:38 AM, David Howells wrote:
> Fix the dodgy maths in netfs_rreq_unlock_folios().  start_page could be
> inside the folio, in which case the calculation of pgpos will be come up
> with a negative number (though for the moment rreq->start is rounded down
> earlier and folios would have to get merged whilst locked)
> 
> Alter how this works to just frame the tracking in terms of absolute file
> positions, rather than offsets from the start of the I/O request.  This
> simplifies the maths and makes it easier to follow.
> 
> Fix the issue by using folio_pos() and folio_size() to calculate the end
> position of the page.
> 
> Fixes: 3d3c95046742 ("netfs: Provide readahead and readpage netfs helpers")
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-fsdevel@vger.kernel.org
> Link: https://lore.kernel.org/r/Y2SJw7w1IsIik3nb@casper.infradead.org/

Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

