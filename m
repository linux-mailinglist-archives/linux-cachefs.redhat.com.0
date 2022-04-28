Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C182514C3D
	for <lists+linux-cachefs@lfdr.de>; Fri, 29 Apr 2022 16:06:13 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-TB0tAvsVNAif-eCcjdMltg-1; Fri, 29 Apr 2022 10:06:06 -0400
X-MC-Unique: TB0tAvsVNAif-eCcjdMltg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3349E86B8A3;
	Fri, 29 Apr 2022 14:06:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8292D111DCF9;
	Fri, 29 Apr 2022 14:06:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A6CC21947057;
	Fri, 29 Apr 2022 14:05:59 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9608A1947047 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 29 Apr 2022 10:26:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 31019407E243; Fri, 29 Apr 2022 10:26:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C30A407E242
 for <linux-cachefs@redhat.com>; Fri, 29 Apr 2022 10:26:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12708833969
 for <linux-cachefs@redhat.com>; Fri, 29 Apr 2022 10:26:16 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-MLg8DDe7NquRsPZ_oU49AA-1; Fri, 29 Apr 2022 06:26:14 -0400
X-MC-Unique: MLg8DDe7NquRsPZ_oU49AA-1
Received: by mail-pj1-f47.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso10147310pjb.1
 for <linux-cachefs@redhat.com>; Fri, 29 Apr 2022 03:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R9vQyV3VXopoorldZBhqjQOAWXe3vDxv13+Q7J/GRjI=;
 b=un9p/zlNTA8uNFiAZL0X9O6ORBsYovNtkNLNo3JGwzqyOqTbqnJSdCVrR0k0ZmqRc3
 vSaxTcA+nRf3PavaxExfLlH6hlACrUAU1LovpXtGFJIuszQoyc87QPp+uQYc8L+dzRsa
 iM4JiyglCqRAkVNlRmO0omkW1QigaKSNu8EmuOvW6CRPFZH/DdR/HnG335MdoTLkK2BI
 tbrbT+zjINpKi9fnMs/JfsxugSPC3amVWS3AAo2k9+TBNmSs+WLtKxL9Qv9EqqKbBwqE
 PNcU+7CHZEZfzSGuSq5eRbIyu6dOCeC39ZoRxleOMVoFp2EUHSWQnWf8rXgF2D8AFbXX
 suOw==
X-Gm-Message-State: AOAM532J3Kn68MByqsrU3B3qxDPezAAeHdYVp6xhKZVqCjkAiPxQvW15
 NLXYuEQJM7g+AkWiXSKeWisQQw==
X-Google-Smtp-Source: ABdhPJy6M+E3y/ei0uS1zFcgKhBsp3sk6J3D0I/zhjzkWgMr5WPhz+ZNkg/j9ZjgM0cUVu0Yt3heaw==
X-Received: by 2002:a17:90b:1c01:b0:1d2:add6:805f with SMTP id
 oc1-20020a17090b1c0100b001d2add6805fmr3086211pjb.29.1651227973166; 
 Fri, 29 Apr 2022 03:26:13 -0700 (PDT)
Received: from yinxin.bytedance.net ([139.177.225.228])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a63ea45000000b003c1b2bea056sm1042659pgk.84.2022.04.29.03.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 03:26:12 -0700 (PDT)
From: Xin Yin <yinxin.x@bytedance.com>
To: jefflexu@linux.alibaba.com,
	xiang@kernel.org,
	dhowells@redhat.com
Date: Fri, 29 Apr 2022 07:38:48 +0800
Message-Id: <20220428233849.321495-1-yinxin.x@bytedance.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Fri, 29 Apr 2022 14:05:58 +0000
Subject: [Linux-cachefs] [RFC PATCH 0/1] erofs: change to use asynchronous
 io for fscache readahead
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
 linux-erofs@lists.ozlabs.org, Xin Yin <yinxin.x@bytedance.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jeffle & Xiang

I have tested your fscache,erofs: fscache-based on-demand read semantics 
v9 patches sets https://www.spinics.net/lists/linux-fsdevel/msg216178.html.
For now , it works fine with the nydus image-service. After the image data 
is fully loaded to local storage, it does have great IO performance gain 
compared with nydus V5 which is based on fuse.

For 4K random read , fscache-based erofs can get the same performance with 
the original local filesystem. But I still saw a performance drop in the 4K 
sequential read case. And I found the root cause is in erofs_fscache_readahead() 
we use synchronous IO , which may stall the readahead pipelining.

I have tried to change to use asynchronous io during erofs fscache readahead 
procedure, as what netfs did. Then I saw a great performance gain.

Here are my test steps and results:
- generate nydus v6 format image , in which stored a large file for IO test.
- launch nydus image-service , and  make image data fully loaded to local storage (ext4).
- run fio with below cmd.
fio -ioengine=psync -bs=4k -size=5G -direct=0 -thread -rw=read -filename=./test_image  -name="test" -numjobs=1 -iodepth=16 -runtime=60

v9 patches: 202654 KB/s
v9 patches + async readahead patch: 407213 KB/s
ext4: 439912 KB/s


Xin Yin (1):
  erofs: change to use asynchronous io for fscache readahead

 fs/erofs/fscache.c | 256 ++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 245 insertions(+), 11 deletions(-)

-- 
2.11.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

