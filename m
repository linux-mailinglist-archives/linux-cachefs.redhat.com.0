Return-Path: <linux-cachefs+bncBCXIHK4S6EJRBTUHSWWQMGQEMFCCZWA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mail.lfdr.de (Postfix) with ESMTPS id A71A882DB77
	for <lists+linux-cachefs@lfdr.de>; Mon, 15 Jan 2024 15:40:20 +0100 (CET)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-5952618dad5sf10970951eaf.0
        for <lists+linux-cachefs@lfdr.de>; Mon, 15 Jan 2024 06:40:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705329614; cv=pass;
        d=google.com; s=arc-20160816;
        b=D2qnTH5nqZStu8hpmhaChZvoatB7bhwZcT2+q4bptobRIZAPBeyKl5i95AA/W+GCgY
         8t5+XYRFKv4lCB31N6rl+HoZkqLCyFe38FV7l12a/u2c4voFZ+bqYasB9UXN3AgmfhNN
         HsgJZLWWaeP7kIX1FkdXkQu/EnGWWlhnvxxlhVyfWmwEfsLCy1C4+85ssOR+KOGEIdkW
         46wf05IwLLx0vRpFaWSysqm8GiC4ImTN/x4JXTK9P/zH4pCiXzmEwpMtJ+xdqwFuTiuR
         Nu6vH0f/WcnpgijUIjU8FZ5V5evSi3QFPpY3rginCba8SF/2/Jjj4sm6Uff32sKUnLEg
         i2aQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=leCPUigjWIj+l6+2QQ1y35v9jmSgHPDWYCnHK8qQYn0=;
        fh=LWHUwXdXD0LoE+MhXumRuFcLZD/w5M5shxQHRoR2bhE=;
        b=MsBCBJxHlq6E/ZcpNAXSr+JtApA6682FrjQp2hh09gJU9HU1cpu+jn/K6qlwzPRppA
         iUKsg6Q+6hTYLpTMWfJmONOCgayNe9X64Vczy8nNERlymBUY6fCqBHgihA26+9HdG1ij
         cNczPQbJGVuFF+YbVzUfSLoSbLycHfsUEnLjzollZDy5qTd2TyIVQKbP3xPm+vf+uJ3i
         m3OIXNJt4UhGYeAAOTt11Q020hHxuElcZxGKtFEGnOsFY/iHuVdjWKFV+zID/xIAPZBN
         3V5klEkYNhI+sakMtz0CkgIZnzJzGY2vp+jPCRJ1IMR9FUXt1EEGwpCPvT27sP+bHSQL
         WZBA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.97 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705329614; x=1705934414;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:delivered-to:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leCPUigjWIj+l6+2QQ1y35v9jmSgHPDWYCnHK8qQYn0=;
        b=HW/avJI8P6EYhaxQQzCCMsV4AoKsMFFAHzsRIqnmAklzyD/g0+oLBXaCbC0UKGUVUH
         e4z+oAOcMMiTKxLx724SW4/MLODf/skFc3I9gkaZyazgQZOlzdfOubOMLRq9g1Pjj9bF
         GIVaGlzrRAqH/VKZq1uXNnqwUecQziwZU7fMaASc50q9slRatXFnur6XkzKQz3JakcDk
         yBFnwMnyJS7usLvA2ErGc3MykPo554oD/4wi1e80AFWt1rI9JJSfhKXSVBswPz7YHUYh
         OygnH6Vx707MtMaWS+Gg26mzuWIXhrs2g6Qha7G9kO4+zf9R9aedxV9u5rjrlcy8X+Nh
         LzoA==
X-Gm-Message-State: AOJu0YyZKrCgP88aeC0/8ZiexQ1ALsXyVez9l/lHKE2a5fTjjy/jSPMV
	Vz3X5pRnsOsKYEzPvh1hlVVTI3if+tRiew==
X-Google-Smtp-Source: AGHT+IGN/hWhX6N7xTy0Bniyo//bpdGuZoTbj+OwkZcSs+RGojTivuJtUQXPbxKYwM8Ma1pmhzI8/A==
X-Received: by 2002:a4a:55d3:0:b0:595:7c83:cf42 with SMTP id e202-20020a4a55d3000000b005957c83cf42mr2825291oob.10.1705329614111;
        Mon, 15 Jan 2024 06:40:14 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:2298:b0:598:bd02:2a71 with SMTP id
 ck24-20020a056820229800b00598bd022a71ls22165oob.2.-pod-prod-05-us; Mon, 15
 Jan 2024 06:40:13 -0800 (PST)
X-Received: by 2002:a05:6830:1007:b0:6dd:ec84:fa09 with SMTP id a7-20020a056830100700b006ddec84fa09mr5596648otp.73.1705329613439;
        Mon, 15 Jan 2024 06:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705329613; cv=none;
        d=google.com; s=arc-20160816;
        b=F8ciJSLGb2vcIeVnVedL3Y5UUZ3N1u4Y6ighCmQb/IRVMi2gjS7wMGVc1eMxC9xEqN
         VHah0xw12sJYRsDwtD95TyNfsoN7bEIgpC/N8vCnVCWneozbEfa0vFLMCCQj8GLs+WAn
         A8Z+nkfw9oV/F3MDXKyOlfPTuUPvKQN9mmZjmi7jfGL0XDDQvojasQswqio0QhQCsS/2
         OPgn74AVnaym33EUKJxLoN+0FaRnKioljXy+BPWM9tVvhZMseje2lo7nJiF4xbfhiQAH
         hvYM5iSyfJqHd96YRNLyBY9ZqamIDsSSL1VCK9RiDbO5buUJez04eYICnkFP0XOuZAvs
         jYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=ZdotrTf4BjmrCqnoE8tygVO3wdVY+bF/AzRG/graG3I=;
        fh=LWHUwXdXD0LoE+MhXumRuFcLZD/w5M5shxQHRoR2bhE=;
        b=rPI8pCHH+eCKGahvoj9oAIT/jzsJ/xUX7a9v/DRjbsMF5LYG5wYBqhAE0U37HmoQFJ
         QXD2cj3AMDrZZVDL+LdgmlpT3QCXGDz3DXUswvXaUOTW35fxK/SxfiSDfjy8p9QRGWvn
         Fsw0kP+lSY3owizAO+8tE0XrevHzYMT+7Ia5GVrUH5NPortDgknGhFgN+GGHVeKcocNQ
         rADmJSN1X1/NAoSmFja7jU7/si9yjipwbc0NgjV5mZ9FktGXsernIQRUbAmpVQEdms9h
         yukfd2WQA+vd8qvfMaqbB8Ry7vxbMJGEHDmWva4qYpj2F2IODvt4lHe3ziBH+IUCZzXF
         rVDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.97 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id v15-20020a05622a188f00b0042581018846si8433617qtc.58.2024.01.15.06.40.13
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 06:40:13 -0800 (PST)
Received-SPF: pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.97 as permitted sender) client-ip=115.124.30.97;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-eKcSCPSsOUSQ21z49xZ2Fw-1; Mon, 15 Jan 2024 09:40:12 -0500
X-MC-Unique: eKcSCPSsOUSQ21z49xZ2Fw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F25B685A59D
	for <linux-cachefs@gapps.redhat.com>; Mon, 15 Jan 2024 14:40:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id EF1D71130A; Mon, 15 Jan 2024 14:40:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E547C10DD4
	for <linux-cachefs@redhat.com>; Mon, 15 Jan 2024 14:40:11 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD9371C106AC
	for <linux-cachefs@redhat.com>; Mon, 15 Jan 2024 14:40:11 +0000 (UTC)
Received: from out30-97.freemail.mail.aliyun.com
 (out30-97.freemail.mail.aliyun.com [115.124.30.97]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-99-4erfZwY0NNa9LrK2MMcbvQ-1; Mon, 15 Jan 2024 09:40:07 -0500
X-MC-Unique: 4erfZwY0NNa9LrK2MMcbvQ-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0W-j1yLV_1705329597
Received: from 30.27.74.27(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0W-j1yLV_1705329597)
          by smtp.aliyun-inc.com;
          Mon, 15 Jan 2024 22:39:59 +0800
Message-ID: <931bcf87-efdf-478f-869b-fcb1260ac1cc@linux.alibaba.com>
Date: Mon, 15 Jan 2024 22:39:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] erofs: Don't use certain internal folio_*()
 functions
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, David Howells <dhowells@redhat.com>,
 Christian Brauner <christian@brauner.io>, Jeff Layton <jlayton@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>
References: <20240115083337.1355191-1-hsiangkao@linux.alibaba.com>
 <ZaU75cT0jx9Ya+6G@casper.infradead.org>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <ZaU75cT0jx9Ya+6G@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Original-Sender: hsiangkao@linux.alibaba.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of hsiangkao@linux.alibaba.com designates 115.124.30.97 as permitted
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

Hi Matthew,

On 2024/1/15 22:06, Matthew Wilcox wrote:
> On Mon, Jan 15, 2024 at 04:33:37PM +0800, Gao Xiang wrote:
>> From: David Howells <dhowells@redhat.com>
>>
>> Filesystems should use folio->index and folio->mapping, instead of
>> folio_index(folio), folio_mapping() and folio_file_mapping() since
>> they know that it's in the pagecache.
>>
>> Change this automagically with:
>>
>> perl -p -i -e 's/folio_mapping[(]([^)]*)[)]/\1->mapping/g' fs/erofs/*.c
>> perl -p -i -e 's/folio_file_mapping[(]([^)]*)[)]/\1->mapping/g' fs/erofs/*.c
>> perl -p -i -e 's/folio_index[(]([^)]*)[)]/\1->index/g' fs/erofs/*.c
>>
>> Reported-by: Matthew Wilcox <willy@infradead.org>
>> Signed-off-by: David Howells <dhowells@redhat.com>
>> Reviewed-by: Jeff Layton <jlayton@kernel.org>
>> Cc: Chao Yu <chao@kernel.org>
>> Cc: Yue Hu <huyue2@coolpad.com>
>> Cc: Jeffle Xu <jefflexu@linux.alibaba.com>
>> Cc: linux-erofs@lists.ozlabs.org
>> Cc: linux-fsdevel@vger.kernel.org
>> Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
>> ---
>> Hi folks,
>>
>> I tend to apply this patch upstream since compressed data fscache
>> adaption touches this part too.  If there is no objection, I'm
>> going to take this patch separately for -next shortly..
> 
> Could you change the subject?  It's not that the functions are
> "internal", it's that filesystems don't need to use them because they're
> guaranteed to not see swap pages.  Maybe just s/internal/unnecessary/

Yes, the subject line was inherited from the original one.

Such helpers are useful if the type of a folio is unknown,
let me revise it.

Thanks,
Gao Xiang

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

