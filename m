Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F87059F8AC
	for <lists+linux-cachefs@lfdr.de>; Wed, 24 Aug 2022 13:36:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661341005;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kLtyqPyWhKl25KxdsemnugwiWn9CZ8Ckmvcbfc/M1DY=;
	b=FXQpLHtkRKu8AiMEGFCIiPLKL+4t5Ib3SVLAz3/yVlyx6uP5eeKVZEBlUXlTNXSlQlIn5M
	9U6gnAkyA9kDb+1NoVeZUZzZUPrMJvlLVUdiqljCrAJut01ZWqsUSKvxni7iApqHGCKGKc
	/fABSx9nLHp3kakP4zbFGKWblsDuatU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-dmYRVs-9PySGtVLFP1RVZw-1; Wed, 24 Aug 2022 07:36:42 -0400
X-MC-Unique: dmYRVs-9PySGtVLFP1RVZw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFA4438173C0;
	Wed, 24 Aug 2022 11:36:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1A4C40315A;
	Wed, 24 Aug 2022 11:36:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 794541946A52;
	Wed, 24 Aug 2022 11:36:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C50851946A42 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 24 Aug 2022 11:33:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 92EC51121319; Wed, 24 Aug 2022 11:33:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F9841121315
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 11:33:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71A3638173C4
 for <linux-cachefs@redhat.com>; Wed, 24 Aug 2022 11:33:54 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-644-wuQPgNQoOYaTJJy3WrOcfg-1; Wed, 24 Aug 2022 07:33:52 -0400
X-MC-Unique: wuQPgNQoOYaTJJy3WrOcfg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0VN7Iwjc_1661340812
Received: from 30.227.73.144(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VN7Iwjc_1661340812) by smtp.aliyun-inc.com;
 Wed, 24 Aug 2022 19:33:32 +0800
Message-ID: <c6fd70dd-2b0b-ea9f-f0f8-9d727cde2718@linux.alibaba.com>
Date: Wed, 24 Aug 2022 19:33:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
To: David Howells <dhowells@redhat.com>, Sun Ke <sunke32@huawei.com>
References: <20220818125038.2247720-1-sunke32@huawei.com>
 <3700079.1661336363@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <3700079.1661336363@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH v3] cachefiles: fix error return code in
 cachefiles_ondemand_copen()
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
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

On 8/24/22 6:19 PM, David Howells wrote:
> 	/* fail OPEN request if copen format is invalid */
> 	ret = kstrtol(psize, 0, &size);
> 	if (ret) {
> 		req->error = ret;
> 		goto out;
> 	}
> 
> 	/* fail OPEN request if daemon reports an error */
> 	if (size < 0) {
> 		if (!IS_ERR_VALUE(size))
> 			ret = size = -EINVAL;
> 		req->error = size;
> 		goto out;
> 	}
> 
> Should ret get set to the error in size?


The user daemon completes the OPEN request by replying with the "copen"
command.  The format of "copen" is like: "copen <id>,<cache_size>",
where <cache_size> specifies the size of the backing file. Besides,
<cache_size> is also reused for specifying the error code when the user
daemon thinks it should fail the OPEN request. In this case, the OPEN
request will fail, while the copen command (i.e.
cachefiles_ondemand_copen()) shall return 0, since the format of the
input "copen" command has no problem at all. After all, the error code
inside <cache_size> is specified by the user daemon itself, and the fact
that the OPEN request will fail totally lies in the expectation of the
user daemon.


On the other hand, cachefiles_ondemand_copen() needs to return error
code when the user daemon specifies the "copen" command in a wrong
format, e.g. specifying an invalid error code in <cache_size>. This is
exactly what this patch fixes.


-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

