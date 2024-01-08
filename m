Return-Path: <linux-cachefs+bncBDLIXLMFVAERB4H556WAMGQEJKTQ6PY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	by mail.lfdr.de (Postfix) with ESMTPS id A73E0827067
	for <lists+linux-cachefs@lfdr.de>; Mon,  8 Jan 2024 14:56:06 +0100 (CET)
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-dbdc02ad3d7sf230186276.1
        for <lists+linux-cachefs@lfdr.de>; Mon, 08 Jan 2024 05:56:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704722160; cv=pass;
        d=google.com; s=arc-20160816;
        b=H8T1DYWuOILnef84mMsv2oeMUDY2jzOu/6J3dDTTecJ1rqxXsUjH6/e2G4EaDG3qrn
         e4HbxOT06aGWSSy40nBfm2bOygRHv/YqK5r3ulPeFnSC+76yTfm75mxIdgT/cWhpxgNT
         bnh7/F8+LnNiMvwmjyOSTOHu0qjDLHs/uqJkx/lANfcpv5ndKL+HGQs1/t4g0521k7aL
         UQ8fpvgXSR6qWQs6VDgIaaqkkQnNYxEJEubkIvx721WnizNn+TTnXa3FTqPLC85QcY/1
         xCVOH/igVp2enp/16FxB+9Xfc76x3s2C16z8krsyss1BenPRkQFtw+eFmbRH9WhVO5TC
         htwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:from
         :mime-version:subject:cc:to:references:in-reply-to:organization
         :delivered-to;
        bh=XbyuXpbiJjwhhzn0yK7mlHCcx5z5+HuyfDKU6XvYVso=;
        fh=hJi8rcqavC/8P1ByTEKmkvOgZuG0cq95evuRQFHl7fM=;
        b=mPin2u2hN7OKOjb81rhU4FfpVxzEuNgFboMf2Ez7R73kpjlwcku5ZTeRM2R8hrTJCt
         jJYD7ee4/JcNPUMrDoW9lap5VHaj9ORYQOD/dbq4ziWJhK0I+CyBuOvq8ort91pdJ0Oc
         qaaQ2E0V9S0jyYG9ICs6B/J+K0smg1A633oEbp0rDy2YFR3/TZimQRb56Sx/Bjk+Bcqn
         TrnW4rePSuB1kDjiD9TAT8FZDSLpDHK6TcZqH4w8TYpNBzxxqADyUnZUO9z+VbFla6iJ
         cBy494oVQGW7FAMf2cibEHRDogPbgb0gepKzvxLxUvya/HnN8b0R8JmGzC4lO7W94EOX
         CbJw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704722160; x=1705326960;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:from:mime-version:subject:cc:to:references
         :in-reply-to:organization:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XbyuXpbiJjwhhzn0yK7mlHCcx5z5+HuyfDKU6XvYVso=;
        b=r5wUdkhvwDm++DScZ2TK0RerO/i16WfbAa/+DQwTUpY57xNPG0I0/tESwi8GJ07Jww
         SNAGCeYTNG3r/3Qp6K1tfqzLm833eCUeNDnWwpZgEQ06sWFByWpbqrvZlVVPDjerPG8A
         LQESKatEWGeu54YDKwgzzOgyLqOvViTmmdb0V4T5U3ivRCRIo5O7RYpj01hn6epdlpy4
         rCbssqX2It7UrdND4WcHyLYU7nIr/lrddO6c6FKqph3Eh2DCEdYcwH5ASzFOg3V6FdRi
         b77OhO7vhTX+Qju+feyHn9oUBu1g+bRaUejAHloN4IP7DtRUtl18QkF17ZrMy1qMYH+O
         1zYg==
X-Gm-Message-State: AOJu0YwzAgjkO3fKxWdRNe5FG66VD4OaEcAfE4/szZuSy74jphpcYUO2
	z2Lyd4NAW1v+TwotLl6VpEtW23VG6YAy9Q==
X-Google-Smtp-Source: AGHT+IEPZaYpK+us9w5CvhvHDQoQ+4eQauWSIg1/vhIYgswSxf+gd68cT0xixoxeOTBttjTSlvjCtQ==
X-Received: by 2002:a25:d689:0:b0:dbe:ac10:9410 with SMTP id n131-20020a25d689000000b00dbeac109410mr2283345ybg.0.1704722160345;
        Mon, 08 Jan 2024 05:56:00 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:d7c3:0:b0:dbe:31da:408e with SMTP id o186-20020a25d7c3000000b00dbe31da408els1131999ybg.1.-pod-prod-06-us;
 Mon, 08 Jan 2024 05:55:59 -0800 (PST)
X-Received: by 2002:a25:c786:0:b0:db5:3b45:3776 with SMTP id w128-20020a25c786000000b00db53b453776mr1328747ybe.36.1704722159697;
        Mon, 08 Jan 2024 05:55:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704722159; cv=none;
        d=google.com; s=arc-20160816;
        b=TKb8bG3eWBUwcZcUBj7jYZKwgfupDkWfFEddBylgiCBRi8TEPTkUqFNaM+UpK+4S1o
         VbeEWvQfcs5vqNB9VSCUgF7kbvtCiDiJHkUHEgCBxfs0LSHlUmcxLzr5sSaqN6OIAQLT
         ltWYchYaNvTIuMiKdryMp21JZMegKHx+Wd/d56LofN4qwvzvPmqT55Q4v9esaEKuDcxp
         SabX6NBBSu566g5r3Myg1REJtNQ8SdHIlx709lc3DhvuActFE3X/zNqk2F7gpOaCFtjp
         J6J5UjxUL5TjV85Qm1XNYsw490eQei/vaXcCO5nYwq2R/a8A5BZSJFDjyzDCBJ3POJGc
         aWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:from:mime-version:subject:cc:to
         :references:in-reply-to:organization:delivered-to;
        bh=3cwOcp1MFrryPduML1Amlp6Emi0Gczn0iuACZPucAo0=;
        fh=hJi8rcqavC/8P1ByTEKmkvOgZuG0cq95evuRQFHl7fM=;
        b=wnbBCvR9vW5aWUTlWtrqNG+RXqns3sgxw/RsGrrcZqpnOhVUmpbbMOhwnEPddc88Uh
         hDjkipn6EU6IThttA1JWP7M6WG0id8woJ7TTprYLZENKi2jMUWBo4DbDYiVj6c64KKuy
         VGaUtEABog1abx3lNEFxdnss4gBBFTXL6HZUEDimKZX3UKXXCg91c5F0wYuupu39OYoS
         LH4OdGNLW3XWlBRwatI166RuzXdqfXoMkrGHQ5DwtQ0FmDy+JIYSOkH/9acAHK/JcU26
         2tP9A6efY7hCU9idd4ph3y8RcMUrHrWk+ENKF3esf8Ysi6QnX36P8OtTSzMYbHE9oeAl
         MQGw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id u21-20020ac858d5000000b004299fb43576si107512qta.62.2024.01.08.05.55.59
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 05:55:59 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-534-rpRdSWTgPvKGScQlPPjwpg-1; Mon,
 08 Jan 2024 08:55:58 -0500
X-MC-Unique: rpRdSWTgPvKGScQlPPjwpg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C79A2380670D
	for <linux-cachefs@gapps.redhat.com>; Mon,  8 Jan 2024 13:55:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id C504240C6EBA; Mon,  8 Jan 2024 13:55:57 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F419240C6EB9;
	Mon,  8 Jan 2024 13:55:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20240108101404.19818-1-duminjie@vivo.com>
References: <20240108101404.19818-1-duminjie@vivo.com>
To: Minjie Du <duminjie@vivo.com>
Cc: dhowells@redhat.com, linux-cachefs@redhat.com,
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
    opensource.kernel@vivo.com
Subject: Re: [PATCH v1] netfs: use kfree_sensitive() instend of kfree() in fscache_free_volume()
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
Date: Mon, 08 Jan 2024 13:55:56 +0000
Message-ID: <1522761.1704722156@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1522541.1704721959.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
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

You sent this twice - I replied to the other post.  But this is an unnecessary
use of kfree_sensitive() as the key is made public.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

