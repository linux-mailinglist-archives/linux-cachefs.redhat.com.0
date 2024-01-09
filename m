Return-Path: <linux-cachefs+bncBCXIHK4S6EJRBTEI6WWAMGQEFWEN2WI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F68286C4
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 14:04:13 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-429a05fd0b7sf10221311cf.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 05:04:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704805452; cv=pass;
        d=google.com; s=arc-20160816;
        b=hs0kX6S4CQkCBGT6O2PHUGGOwMYc5GO0go2fOtL72T+Vd183EjKD87GnBXAkoPxL8N
         s8bPst/MrVpTQEa1fZMYYkx9oVU5rwHfMtNaI07cuivKU4mu7ReAzmp4prwHe5Isa390
         kovJS/tVypf7XTobPpnQTU2reiw50S/f49nnqgptv3ixfhOdJ0hE0mGrSdKostW1RIVY
         Nsr9ne9grpcgA/v3Kgn72IzcOTkmpyFpslC8t4iiLitJ3DXhL9ThixseBFPtGf6zfZv2
         Lr3ltNWIODY+rcnz31wilvT+Aij1/wXxgi57fZNbWNsGQOdKGPovQnSK1mUJUPEHck7h
         eWAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=ySCLtgo4a5jFMGApF/eUKOtUpdTg1CWa4Jh9N00qxYg=;
        fh=nSKpcQO5ryQlQONbHVfJs9SgTc/wuYdAkwcSZWFFeQg=;
        b=Qu4tQkLk33fhqTSzq1QiWk2L4SYVdjZKh9HhEjr/01QoGq/dEf2fy8kQ19kwcKuQAC
         TMyVOyY/ZhU+NTba99twtuRmhWchjq4oZWHUZaGbyroIHmVrdVPNdMNMm4eUYdDEhpoA
         OiinbXhzTYT5Lz7hx30tl4Po5v0NcJoqlngfItIY6i16AWXRRNEQlRnQc4gcQ+L6OSuh
         yyYDRBZN6ULYodtL9za7yumvSnIvtjbWMczxYHY/5B9MxIyU2kl9AHohjzyvzDWaHSJn
         hKQ/i/woTQyxcZ0qWNGcMovrd1X9x70xHICmqLtunOlnVWhR0Mr6ue1bFoey/FpNkkp6
         d9nw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.124 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805452; x=1705410252;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:delivered-to:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySCLtgo4a5jFMGApF/eUKOtUpdTg1CWa4Jh9N00qxYg=;
        b=X9mY6ysU7dHOjawY+QXyRInDA2zsZZpbY10jdwyJguHF7m3LdTJijTH9hKxU03jLP9
         b38Nls+gCfyyHvGZ3Zda5Gqr8OIx2QkZwk4aDmc4WBbvZTlnGs5Kr3pOnfu7BMss9CxA
         29rx21kbBLYhlvkche7DL+bj9Z294fuu4O4n0SWq7QjRpPAdOyRzZJDAC2XXfPpeJVEt
         eXZTMp1mKzROAwuiE32PEzupl8a7NotrH/cqEW9LkXil5N8ARkrxqmQud7lOADu6ysDF
         9nFfJ/7N0R599eX7jBYncjqv9+Qj8DmzYURCvUs4/zfxQ088Cu9aDzTwK3kLPG6f9jX0
         I8dA==
X-Gm-Message-State: AOJu0YyJpK7ija8Ln6/g4/W1e+OVTrVmTONWdc488XWkzb4+m6YXZcH8
	IionXpl+sYJegNGDSAzKEGgBduF2IoTEow==
X-Google-Smtp-Source: AGHT+IHnDx+nmLhqv4M+ztsC2OPjkzezYdzMUAYgv5ERcE0MvNpleHTolBC0IxOxWYSvkN/fUZjTlw==
X-Received: by 2002:a05:622a:183:b0:429:76b3:7543 with SMTP id s3-20020a05622a018300b0042976b37543mr5832551qtw.73.1704805452446;
        Tue, 09 Jan 2024 05:04:12 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5710:0:b0:429:8a55:a8a9 with SMTP id 16-20020ac85710000000b004298a55a8a9ls1200936qtw.1.-pod-prod-08-us;
 Tue, 09 Jan 2024 05:04:11 -0800 (PST)
X-Received: by 2002:a05:6102:941:b0:467:aff0:55d6 with SMTP id a1-20020a056102094100b00467aff055d6mr1587312vsi.22.1704805450603;
        Tue, 09 Jan 2024 05:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704805450; cv=none;
        d=google.com; s=arc-20160816;
        b=uWP86/xapIiPZIBmMBpHUmR+mv+xMf7mN6qEU2150ehEV5TYa15aUpMuv3nBeOJRuF
         uuyS0mXWbyXDmSoI+MG5VqTumo9RLxfL/GwpfVAYAtBWmZo2cAoihNH2KKvav4NgupI9
         oDqrKIKkeukE/NAgCEbzZwl8VKsgLjdO9sNZCf2iqQLyR7MbLJHPWt9Fme4yAfHpOx8L
         2OHfQJUKDk7nJ4YsakjWS4NbByY5hc0YKQdHKBSDHYm3fC26W9iKi5fgojBV6fQ7dSCJ
         vPfp2DzcPAnRIO1NkPYfubGqeEwgUGr/VPOrb8Xa/o9U6fhiux5wSa4l/LS60L3sB/a1
         4w9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=/svxzZmIh8j0CHFFINhIgyBxdrk96PaZOTl+A6ApJOM=;
        fh=nSKpcQO5ryQlQONbHVfJs9SgTc/wuYdAkwcSZWFFeQg=;
        b=LW4+ZPD9OsxMzKShcFl/HCNb6dGwBsg4vaVVibuX11z1deWQu40n3MpKc+Lu9Mwo0+
         SRqgBg1k8bK5mstv+4S9laV7HmjZ47jO2HY7cQVtOGnU0Xzg2Jiit9d35YI/lhuM3oUV
         8l8JdAoKjBH/pQmGm9o2JTqtvtTop+Z8n5hNlfdoyNQaS+ACo+NNkxAYwQvsl6QMT8sh
         Q4AWOrCJXmVKbhYIyYCgQs9E57HyNTqwip+ivDRxTJkoUzcMhtJOb1YkxfYg6lN/gGcg
         n3dJ2LBBmsQMxpUoqfBCiIDfMkffEWRo0x7QOWOEypxdLctfGeN8d/siPNywNX7ustlx
         vOjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.124 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g19-20020a67ea13000000b00466f6d785d2si192576vso.617.2024.01.09.05.04.10
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 05:04:10 -0800 (PST)
Received-SPF: pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.124 as permitted sender) client-ip=115.124.30.124;
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-108-mHo2d6ZxPwyO4PDUowVJ3g-1; Tue,
 09 Jan 2024 08:04:09 -0500
X-MC-Unique: mHo2d6ZxPwyO4PDUowVJ3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5A2C1C2B676
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 13:04:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id C1CA240C6EBA; Tue,  9 Jan 2024 13:04:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BADBB40C6EB9
	for <linux-cachefs@redhat.com>; Tue,  9 Jan 2024 13:04:08 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A92238135F7
	for <linux-cachefs@redhat.com>; Tue,  9 Jan 2024 13:04:08 +0000 (UTC)
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-651-8sIY9tdwPe6D00uAPILjIw-1; Tue, 09 Jan 2024 08:04:06 -0500
X-MC-Unique: 8sIY9tdwPe6D00uAPILjIw-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0W-IeJTb_1704805422
Received: from 192.168.33.9(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0W-IeJTb_1704805422)
          by smtp.aliyun-inc.com;
          Tue, 09 Jan 2024 21:03:44 +0800
Message-ID: <cab7415b-3c5b-49ea-86c2-bdd0aee3c4b9@linux.alibaba.com>
Date: Tue, 9 Jan 2024 21:03:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] cachefiles: Fix signed/unsigned mixup
To: David Howells <dhowells@redhat.com>,
 Christian Brauner <christian@brauner.io>, Jeff Layton <jlayton@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>
Cc: Steve French <smfrench@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Marc Dionne <marc.dionne@auristor.com>, Paulo Alcantara <pc@manguebit.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Eric Van Hensbergen <ericvh@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, kernel test robot <lkp@intel.com>,
 Yiqun Leng <yqleng@linux.alibaba.com>, Jia Zhu <zhujia.zj@bytedance.com>
References: <20240109112029.1572463-1-dhowells@redhat.com>
 <20240109112029.1572463-6-dhowells@redhat.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20240109112029.1572463-6-dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Original-Sender: hsiangkao@linux.alibaba.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of hsiangkao@linux.alibaba.com designates 115.124.30.124 as permitted
 sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>



On 2024/1/9 19:20, David Howells wrote:
> In __cachefiles_prepare_write(), the start and pos variables were made
> unsigned 64-bit so that the casts in the checking could be got rid of -
> which should be fine since absolute file offsets can't be negative, except
> that an error code may be obtained from vfs_llseek(), which *would* be
> negative.  This breaks the error check.
> 
> Fix this for now by reverting pos and start to be signed and putting back
> the casts.  Unfortunately, the error value checks cannot be replaced with
> IS_ERR_VALUE() as long might be 32-bits.
> 
> Fixes: 7097c96411d2 ("cachefiles: Fix __cachefiles_prepare_write()")
> Reported-by: Simon Horman <horms@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401071152.DbKqMQMu-lkp@intel.com/
> Signed-off-by: David Howells <dhowells@redhat.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> cc: Gao Xiang <hsiangkao@linux.alibaba.com>
> cc: Yiqun Leng <yqleng@linux.alibaba.com>
> cc: Jia Zhu <zhujia.zj@bytedance.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-erofs@lists.ozlabs.org
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-mm@kvack.org

It looks good to me,
Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

