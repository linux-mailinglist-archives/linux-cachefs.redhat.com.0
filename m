Return-Path: <linux-cachefs+bncBDKYBHUEQUPBBDO2U6YQMGQEACCZ6WI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 9583B8B1A65
	for <lists+linux-cachefs@lfdr.de>; Thu, 25 Apr 2024 07:41:34 +0200 (CEST)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6994b2fdf39sf8362666d6.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 24 Apr 2024 22:41:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714023693; cv=pass;
        d=google.com; s=arc-20160816;
        b=VtCNXj4GSleQeAV9+xJvs+XRFQt/wsXx8Ks1ZrevKJ6dA5kEdG9+dteGTSTXqLpDOw
         Fmiu+AnNCsBDPKmejlkFpnxaCkPNOL5MG4aYhy8XXfA2l9A/KPPXYkkENEY8RPM6e9/y
         xCy/lwBu42W+cqQFh29oTjUgen10nlbqmq/ny5/a6+jd3V2xwrw/2S2trlWSDIsTKLoD
         yhG5oNIBoY+9ZC2aKVyzI8fur14NR3OEHk9rM3dT+FTGBLvgmEfM+giRKeRT9PD8kHDM
         gyQROTUW8RFUolG++uENCA52fcP7B9MHaMveDpJzRb+/z8RTEV+yKzx8YdGg0kqq1gdw
         RQ9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:reply-to:content-transfer-encoding
         :in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:delivered-to;
        bh=Zghe0Dxg/bK5W81Y01IsbGS2yJgqTIK40Wl3ZtQPLfU=;
        fh=C61OQBV6IvgvCUWusaKXKx08FuvVDglvEkKtOgCwIEI=;
        b=qulxzKmlMoH9MAQdSlAEjf3+uK3f6mZ50QAzZe7m0pj2eRqFGoKCtU17p2JZzRz85p
         bCrUIg6oqv7xUob/O48nJeA8lfI0BjZDaqCtS1EMr4rLp6oTJIf91iTUV/4bXmpo+QI1
         jyqTi2V/0R8tCgW+VGc6lX+vKswDajN79rdeu7Jfz1jmIfFNuOH8H7USEiBwZUUUEf1/
         UoOW9uIJiqXtq1dRHHfzTf7zZ3ULJ63BCBHwtQoyr/IQP5iwh0szgY377gTUwy1ijKvX
         t7fxOarj8PyR+Agn4zbusx2E15atBDXwJ2dXfkaPKeCqdHVpCehyQ0rKzh1ftCVKqVAx
         RElQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.210.176 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714023693; x=1714628493;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zghe0Dxg/bK5W81Y01IsbGS2yJgqTIK40Wl3ZtQPLfU=;
        b=CSk4zDdK8tpUongxMYx1pu0SrxAPReJevevJYd3k2oZ3sIA645XmU3HRABVlExbuu5
         z3h+Zg8ztcHceBBWnkXQZV/55iY6r/MImkcL/R6WCV3G3Fkq0YWgRtPJclcAi10qL4Uc
         CvnZAzbEU/2FwdihM2gf5ujBrwPDv0GbUlMIt03dbiS9/w5c1DWqNA/EVP8ZmjSLgaOK
         rjOaOTPcLj1hEGMiB9+XoycoyI5/aKujQLeMRTrt/QdRORMf676LmcclkraDj/oK+CDR
         oUOurPp9HP7PIL7zlfyUcRD3+N4o8jP+qi6XXqBt28kdyD+DTjHyVG8ZV2ElOflh9UvS
         5EZw==
X-Forwarded-Encrypted: i=2; AJvYcCWDh4aX8XaOYzQrcTp1YLoUt7pZLCPUa8a27qRSigfTGzcfZQri2KBND1LG8DAj8B6oZYZHnSUAEe/gt41XEPUCciBvlonI5I/PF9I=
X-Gm-Message-State: AOJu0YzRAwxoH2Sh9WbTxzAzsQAD9Mrr2sXr+YcVLab8OjPByj8SpHxu
	1dfvpWpY30QNr6LchvwSGRU65Hxi71lYSqTz88whXeGBQh/s+S7PUypaE2hKld0=
X-Google-Smtp-Source: AGHT+IG82TUW2UGQeOAL6hcP1YVnz8SxMsJmMaIJVhyYzE1aQRBmn/fqRY/UgW6H3kgUzUIgkCf3CQ==
X-Received: by 2002:a0c:fa4e:0:b0:6a0:7d8e:b1f7 with SMTP id k14-20020a0cfa4e000000b006a07d8eb1f7mr4801489qvo.0.1714023693299;
        Wed, 24 Apr 2024 22:41:33 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:e45:b0:699:417b:f82a with SMTP id
 6a1803df08f44-6a09c6323f2ls8231886d6.1.-pod-prod-03-us; Wed, 24 Apr 2024
 22:41:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVK6UVete0R7Z+rdr1dNayV6NgqL41q44ZDjTq/a6YQzbclKzeN/FdkMSnn+phyPLMoDjjkz0i7ff2TVVfKVGGo7BZgAubFixDRc4ztPkI=
X-Received: by 2002:a05:620a:1010:b0:78d:6ba0:47d4 with SMTP id z16-20020a05620a101000b0078d6ba047d4mr4918308qkj.74.1714023692722;
        Wed, 24 Apr 2024 22:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714023692; cv=none;
        d=google.com; s=arc-20160816;
        b=bQ+SYqn3dgLSzMgWIIv3cawJUyGMm7w91BLWxSvRFhmZUV8+/Db8lO9JnrN5Rl9mnz
         Po4AqbAnceNcelSEYl4dk+LKBbsJas72HH+J00eh4mufTkuc/4rUC34fO/J5B9EvkodL
         aNbMCFrF63URELyBLxWfvx2TB2sd2M/dyIsmAM+pNYVWRIy2tSbBobSUMxpiTISH6kAs
         KQdM4r4jQ9oAxO9OtWN80KNW3gLMSILg8VMcZvEYycDE0rmfBtcjbaYqcY0x35nmJ/1V
         kCVBfUpjUkujtRstMKhN/jdIA1HBnJBdQmaw5O4UI55HmE9oQIrmRnJoknDxxYJlLdk0
         n+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=LiVVv+CXcN+CvM+zB+3igsIJaaE0zH8C5SDY181CcQk=;
        fh=9dad6ieKnwYZMYgumvD32nIVst3Qo2TcNXqmM3tXPDI=;
        b=N+bA8W4/IrOORGUQFLAVbYTfOK2JAz/xuHzDs55fpIDlwxO1EbbNobOfnECht0ndea
         PNtnhCFljRb8GuZQKVyHEOzjEs7d3t+rN/fcMdDS/xhz+20z1njfxbS+m/3BhlPBuPfF
         H/Y5+wQWgQK6h8Iu48BxZFTaWXtXVW9POg84LQeqHiBJyDLcg56IROg6P/Kylgs08Znz
         B95aigp1ZHONkYswb7FdxvnWfdkmLO3QPQkF4DSMiIgMIYaY8FodxyAmAjm+l66SsPTB
         30TvBME8QPbA3AFR0kh4Ia/mgu1XgdSkzEug8gC0Gd3TUkYHid61VXoD5zaCo0F1U7xe
         QWvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.210.176 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id da31-20020a05620a361f00b0078eeb6bac0dsi15725428qkb.244.2024.04.24.22.41.32
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 22:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.210.176 as permitted sender) client-ip=209.85.210.176;
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-372-E42wMThvOCKFVTJgchVlzg-1; Thu,
 25 Apr 2024 01:41:31 -0400
X-MC-Unique: E42wMThvOCKFVTJgchVlzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE5E41C0512B
	for <linux-cachefs@gapps.redhat.com>; Thu, 25 Apr 2024 05:41:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id CB6CD40C6DAE; Thu, 25 Apr 2024 05:41:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9303E40C6CB2
	for <linux-cachefs@redhat.com>; Thu, 25 Apr 2024 05:41:30 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [170.10.128.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D56A8002EA
	for <linux-cachefs@redhat.com>; Thu, 25 Apr 2024 05:41:30 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-Cn1abm-1Mrq24W3ucEW9UA-1; Thu, 25 Apr 2024 01:41:28 -0400
X-MC-Unique: Cn1abm-1Mrq24W3ucEW9UA-1
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6edb76d83d0so587060b3a.0
        for <linux-cachefs@redhat.com>; Wed, 24 Apr 2024 22:41:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpffqe/KC9uqF8oG+v1ybVKQgQv6UTRyHaLwFII1Hm99QKD87FxNdlYRM73qMK8kmFSKZFb91EM5nwVhALda1DjWhFM5k9Dso=
X-Received: by 2002:a05:6a00:1492:b0:6ed:1c7:8c5d with SMTP id v18-20020a056a00149200b006ed01c78c5dmr5655256pfu.12.1714023687307;
        Wed, 24 Apr 2024 22:41:27 -0700 (PDT)
Received: from [10.3.132.118] ([61.213.176.14])
        by smtp.gmail.com with ESMTPSA id a5-20020aa78e85000000b006e554afa254sm12333974pfr.38.2024.04.24.22.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 22:41:26 -0700 (PDT)
Message-ID: <8572a732-ca12-48d7-817c-d8218d536c0c@bytedance.com>
Date: Thu, 25 Apr 2024 13:41:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] cachefiles: flush ondemand_object_worker during clean
 object
To: libaokun@huaweicloud.com, netfs@lists.linux.dev
Cc: dhowells@redhat.com, jlayton@kernel.org, jefflexu@linux.alibaba.com,
 linux-cachefs@redhat.com, linux-erofs@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hou Tao <houtao1@huawei.com>, Baokun Li <libaokun1@huawei.com>,
 zhujia.zj@bytedance.com
References: <20240424033409.2735257-1-libaokun@huaweicloud.com>
 <20240424033409.2735257-4-libaokun@huaweicloud.com>
From: "'Jia Zhu' via linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
In-Reply-To: <20240424033409.2735257-4-libaokun@huaweicloud.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: zhujia.zj@bytedance.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of zhujia.zj@bytedance.com designates 209.85.210.176 as permitted
 sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Original-From: Jia Zhu <zhujia.zj@bytedance.com>
Reply-To: Jia Zhu <zhujia.zj@bytedance.com>
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

Thanks for catching this. How about adding a Fixes tag.

Reviewed-by: Jia Zhu <zhujia.zj@bytedance.com>


=E5=9C=A8 2024/4/24 11:34, libaokun@huaweicloud.com =E5=86=99=E9=81=93:
> From: Hou Tao <houtao1@huawei.com>
>=20
> When queuing ondemand_object_worker() to re-open the object,
> cachefiles_object is not pinned. The cachefiles_object may be freed when
> the pending read request is completed intentionally and the related
> erofs is umounted. If ondemand_object_worker() runs after the object is
> freed, it will incur use-after-free problem as shown below.
>=20
> process A  processs B  process C  process D
>=20
> cachefiles_ondemand_send_req()
> // send a read req X
> // wait for its completion
>=20
>             // close ondemand fd
>             cachefiles_ondemand_fd_release()
>             // set object as CLOSE
>=20
>                         cachefiles_ondemand_daemon_read()
>                         // set object as REOPENING
>                         queue_work(fscache_wq, &info->ondemand_work)
>=20
>                                  // close /dev/cachefiles
>                                  cachefiles_daemon_release
>                                  cachefiles_flush_reqs
>                                  complete(&req->done)
>=20
> // read req X is completed
> // umount the erofs fs
> cachefiles_put_object()
> // object will be freed
> cachefiles_ondemand_deinit_obj_info()
> kmem_cache_free(object)
>                         // both info and object are freed
>                         ondemand_object_worker()
>=20
> When dropping an object, it is no longer necessary to reopen the object,
> so use cancel_work_sync() to cancel or wait for ondemand_object_worker()
> to complete.
>=20
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> Signed-off-by: Baokun Li <libaokun1@huawei.com>
> ---
>   fs/cachefiles/ondemand.c | 3 +++
>   1 file changed, 3 insertions(+)
>=20
> diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
> index d24bff43499b..f6440b3e7368 100644
> --- a/fs/cachefiles/ondemand.c
> +++ b/fs/cachefiles/ondemand.c
> @@ -589,6 +589,9 @@ void cachefiles_ondemand_clean_object(struct cachefil=
es_object *object)
>   		}
>   	}
>   	xa_unlock(&cache->reqs);
> +
> +	/* Wait for ondemand_object_worker() to finish to avoid UAF. */
> +	cancel_work_sync(&object->ondemand->ondemand_work);
>   }
>  =20
>   int cachefiles_ondemand_init_obj_info(struct cachefiles_object *object,

To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-cachefs+unsubscribe@redhat.com.

