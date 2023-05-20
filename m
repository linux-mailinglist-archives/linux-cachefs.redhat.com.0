Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878070A492
	for <lists+linux-cachefs@lfdr.de>; Sat, 20 May 2023 04:13:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684548789;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wVSSxgXSFu6x5qoM9f2Z83mAvegBwDfwqF7sb2S1gHI=;
	b=Bv7beEvOJkHuAUFfOdGHNI/Gp4n5Qd7dVeLcXKaOLX6Tl6qkt9/HO6uMadnsb59KZPcjvT
	ErQJuSZy+ymcFIu8adlRAyKlQUhmxemCq0yEa44gqH9y0vhNr1osRjyZP06fKhaI2brf2m
	2UnZJ1xC0UDCCgnAitWvXCtGiuydyew=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-Ojsc8oY7NFqIO0GWhnMPJQ-1; Fri, 19 May 2023 22:13:06 -0400
X-MC-Unique: Ojsc8oY7NFqIO0GWhnMPJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BF3F3804520;
	Sat, 20 May 2023 02:13:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98C59140E955;
	Sat, 20 May 2023 02:13:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 080C819465BA;
	Sat, 20 May 2023 02:13:01 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 24CC319465B3 for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 20 May 2023 02:12:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ED95F40CFD01; Sat, 20 May 2023 02:12:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5BF040CFD00
 for <linux-cachefs@redhat.com>; Sat, 20 May 2023 02:12:58 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF4C93C0256B
 for <linux-cachefs@redhat.com>; Sat, 20 May 2023 02:12:58 +0000 (UTC)
Received: from out199-7.us.a.mail.aliyun.com (out199-7.us.a.mail.aliyun.com
 [47.90.199.7]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-ncNm1_cwNTiY3dSu2z8csg-1; Fri, 19 May 2023 22:12:56 -0400
X-MC-Unique: ncNm1_cwNTiY3dSu2z8csg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0Vj0SAfv_1684548461
Received: from 192.168.3.7(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0Vj0SAfv_1684548461) by smtp.aliyun-inc.com;
 Sat, 20 May 2023 10:07:44 +0800
Message-ID: <caa318ba-a6fb-caa9-c7e0-f1f13b5ee577@linux.alibaba.com>
Date: Sat, 20 May 2023 10:07:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
References: <1853230.1684516880@warthog.procyon.org.uk>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <1853230.1684516880@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: Allow the cache to be
 non-root
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
Cc: linux-fsdevel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"



On 2023/5/20 10:21, David Howells wrote:
>      
> Set mode 0600 on files in the cache so that cachefilesd can run as an
> unprivileged user rather than leaving the files all with 0.  Directories
> are already set to 0700.
> 
> Userspace then needs to set the uid and gid before issuing the "bind"
> command and the cache must've been chown'd to those IDs.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: David Howells <dhowells@redhat.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-erofs@lists.ozlabs.org
> cc: linux-fsdevel@vger.kernel.org

It seems useful on our side as well and safe:

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

