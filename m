Return-Path: <linux-cachefs+bncBDLIXLMFVAERBW4EQOVQMGQEF7JROYA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FA87F77E2
	for <lists+linux-cachefs@lfdr.de>; Fri, 24 Nov 2023 16:33:48 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4238180a464sf22703941cf.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 24 Nov 2023 07:33:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700840027; cv=pass;
        d=google.com; s=arc-20160816;
        b=ivVGFEo70xqqqysfBgvO1dQi9nPozO5n2MmJyCmNEKH7noE4y4ZJ43Kw7td0NFOAMH
         7iqanmZKTpu9EnhOrvf59HpjMDMRRfQsGITJOhELnhgzh+Mz7u1Otyd7FiurzoxHeNej
         Kp77cn3+3KcsxbUAmcS1iav8/yBdXdWMmqSVS6HOwVQ/2nID6pE8ZyQVaWEKhrXspJzC
         6vY2vdRNsECgquClIwEohvg2bjX/+dB+VW96xRABTh6EQS1sqfFpbdpZPg1BedODA1W4
         90l2Wx6sfDiq191AqfE8H7iNn1Wllu4FjIZSi/OhNJBGpRR6n/1WvvOuSOe28CeRsfRq
         7JeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=mgTESaxCZH9MEgytgIFEWUcNIPs4xT48c9diNZ2DlRE=;
        fh=KSLZ8cB4rMsueft4ns/ZnJg87gQm9RvRYZcvtdMGsvo=;
        b=XFL9roEYaImAsXrKxu7zjIikVis5GqDtU28TdiCDaAwYrciBX48oDK5e4s+6qKdyNK
         /y/fTpAlr+XpDtYOZegB/e969VUxRW9wXQW6lgK0hVfZ2LTP5eYb17NPxRXJB2rbBTJR
         EeUUQc2kMqbInS9zpDDdbO/K9kuwSrWywoiOGxRsGigyDrplYoTOP7iPnAIdi8j/OTjq
         gKbjzkFU6yBUy0aWHpbMnUpdUH0o88TCYWqvNF4wExC3cBP+JZ9dGUU8k5GLVo8w1gQH
         8YfSEZN5Rw4jhGO7XlveERMg1/SY6wpbCFPjUgPP+/hyPA+Do+7L0Ikbt57ZMv3n89vN
         u7TA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700840027; x=1701444827;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mgTESaxCZH9MEgytgIFEWUcNIPs4xT48c9diNZ2DlRE=;
        b=CM6xwBvnS54FkVfgdD7I+5skyTKF90MLEO0E0JX/Gzbsv/nnQ/7y5nxr82GFYz1iaX
         ruf6rkoYP+LTaLNjUUlV3f/tROxOlk6aDvnyrnRHP7pmpoB0zXOpVSN/E1x5Rp5ve4/L
         zn38fp5l1ye9Y6MZa9Kw4IhbdKa80It1BGrYSlsF/5bcgN5gIkM8qOwAYGvuqqK7XweM
         SK95Qe8kg3dUlECWEwHZbG9fZuWtQ9mKvCO67thT+00M3Q4gEwLxMxZdQy8OnXy0sGfE
         Jc6fmMjUBAIkwk1M/+4BNWHpCHxh6myjehXOOdD6incobqUdJ+28N39RDJgewNS0Pasr
         hRZw==
X-Gm-Message-State: AOJu0Yyq8c+mLA/ysEN3fFlKVvFYlY7beJD4OJ8zuhbfNzM7QWdiLjgZ
	S/gEg2bNPmIpkQ2C09IXceJirw==
X-Google-Smtp-Source: AGHT+IHvBYpkkQOJghRA4xVRiHMiP01mEc9hU67uTsZu+oy9xIvvb7+Ds3XDL0CPP4P8mXxi5vtsAA==
X-Received: by 2002:ac8:5f4b:0:b0:423:9434:1321 with SMTP id y11-20020ac85f4b000000b0042394341321mr3486987qta.5.1700840027309;
        Fri, 24 Nov 2023 07:33:47 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:2c3:b0:41c:d096:577c with SMTP id
 a3-20020a05622a02c300b0041cd096577cls201289qtx.2.-pod-prod-07-us; Fri, 24 Nov
 2023 07:33:46 -0800 (PST)
X-Received: by 2002:a05:6214:5611:b0:67a:1f05:5c7c with SMTP id mg17-20020a056214561100b0067a1f055c7cmr1228935qvb.32.1700840026637;
        Fri, 24 Nov 2023 07:33:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700840026; cv=none;
        d=google.com; s=arc-20160816;
        b=nLHO2MXuDjz3WIgUIgfGwHjpl/lr4l1fLpbzwLhIyWWD8cUM7WnikoWS9TGPsImYTU
         +OsRNw63VfJrdGGSxU6nUuowbaLta+ZX+w/Y2cYBuS8u02gD4NQzsbvodP9qoPywWeQ1
         FvcLWTPNVhXzQTvTvMvXKk9uEyp5XhsM+5gbUrGhnnJUYHejtEgn0AE7hQbgaTeIUYDg
         BC1gsXhdu9LmzfeM58xKXdStHB/XK5+xWC60xD6m7zerdP9msecGcxuStryXjsDD6AKU
         RFAllknu5erbKou4XXxpgkLnnTyV/yBfcXhXtAjOXtHGeGZS8NSKbpJ85cRiuxXr6v3y
         yS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=LbHOKemj3x3i/RRfgL4O8FQ7JtEapB4R9zBWaNJlTbY=;
        fh=KSLZ8cB4rMsueft4ns/ZnJg87gQm9RvRYZcvtdMGsvo=;
        b=WTre4d+LB3q2qDF9JwEFPSGVbiQpeHOcYj69GYz5pieOZDXjNYRhbp8mIMcvRX7pkh
         nhCHc3wD86DWa2vumLv4Gily54okBJhL+pv3fO6Fw5SXmcGE0CP+naeCcR1aKY4hOuMU
         QsHrTD7izeebio79mv9N7dubK3Vhfpm3OShJ5IF09xU0oN9ifKbAa353AX8vDcmbmr9k
         YwmPiy2CzYaBm8PQdkBb5JiBuU851Yy6/ZmMN3VuU+q3Zs8Slz8WmXLjSlFs0KosRkgB
         1rNVL5kga7IcWMwwa6Q2tyXeeJNEZ0aqxB/Y6mE2iUztm4xiPMbKiJOOjKTH78Gkfq1g
         eVRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id jy23-20020a0562142b5700b0067a21257a29si288267qvb.318.2023.11.24.07.33.46
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 07:33:46 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-34YWQFxsMl2kFFTIX-VoHA-1; Fri, 24 Nov 2023 10:33:43 -0500
X-MC-Unique: 34YWQFxsMl2kFFTIX-VoHA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3A6089C800
	for <linux-cachefs@gapps.redhat.com>; Fri, 24 Nov 2023 15:33:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E0A0B2166B2D; Fri, 24 Nov 2023 15:33:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEC1B2166B26;
	Fri, 24 Nov 2023 15:33:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20231120041422.75170-1-zhujia.zj@bytedance.com>
References: <20231120041422.75170-1-zhujia.zj@bytedance.com>
To: Jia Zhu <zhujia.zj@bytedance.com>
Cc: dhowells@redhat.com, linux-cachefs@redhat.com,
    linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org, jefflexu@linux.alibaba.com,
    hsiangkao@linux.alibaba.com
Subject: Re: [PATCH V6 RESEND 0/5] cachefiles: Introduce failover mechanism for on-demand mode
MIME-Version: 1.0
Date: Fri, 24 Nov 2023 15:33:40 +0000
Message-ID: <1172306.1700840020@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1172305.1700840020.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Reviewed-by: David Howells <dhowells@redhat.com>

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

