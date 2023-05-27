Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3B87138A0
	for <lists+linux-cachefs@lfdr.de>; Sun, 28 May 2023 10:02:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685260951;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eMbL/mkh7yaSEvzod3DCH+gvTQbUXHZDLKc3Y1FOi4k=;
	b=QDpvwKx4pTC1frGb4u3xVqzJ5kPJqS3/zrK5/LkEYZqXECSWH+Z6YmlHEd0NbwhfCy4wQe
	7+ViF9Ll7TlMZ+3EQFPc5bzV62B5Ds05kYu7Fwke3s00Xb/zBxnAIr02OBUbuKQZKNdFrB
	n5lzfQvHvJDygArIY+WGpxvDLEuOWZY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-fFMGCpD0NPyFCYRoCgB7CA-1; Sun, 28 May 2023 04:02:28 -0400
X-MC-Unique: fFMGCpD0NPyFCYRoCgB7CA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 01E8A801224;
	Sun, 28 May 2023 08:02:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43A6040CFD46;
	Sun, 28 May 2023 08:02:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DFD3E19465B7;
	Sun, 28 May 2023 08:02:26 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 69DAD194658C for <linux-cachefs@listman.corp.redhat.com>;
 Sat, 27 May 2023 12:25:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 48AE5401024; Sat, 27 May 2023 12:25:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E918492B00
 for <linux-cachefs@redhat.com>; Sat, 27 May 2023 12:25:15 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E3DB1C03DB1
 for <linux-cachefs@redhat.com>; Sat, 27 May 2023 12:25:15 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2121.outbound.protection.outlook.com [40.107.223.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-g6xYn7OGPBScBLAOU63NSQ-1; Sat, 27 May 2023 08:25:12 -0400
X-MC-Unique: g6xYn7OGPBScBLAOU63NSQ-1
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by PH0PR13MB5471.namprd13.prod.outlook.com (2603:10b6:510:12a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Sat, 27 May
 2023 12:25:08 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::5e55:9a39:751f:55f6]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::5e55:9a39:751f:55f6%3]) with mapi id 15.20.6433.018; Sat, 27 May 2023
 12:25:08 +0000
Date: Sat, 27 May 2023 14:24:57 +0200
From: Simon Horman <simon.horman@corigine.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <ZHH2mSRqeL4Gs1ft@corigine.com>
References: <20230526143104.882842-1-dhowells@redhat.com>
 <20230526143104.882842-3-dhowells@redhat.com>
In-Reply-To: <20230526143104.882842-3-dhowells@redhat.com>
X-ClientProxiedBy: AM0PR10CA0123.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::40) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|PH0PR13MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: 55200223-d275-414b-eb58-08db5ead68e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: y3+MoLq/14Ctzcat+G/USt33jdvYtkVasElOTf42r13hXoerUfrJHCRrvcWiaVAFmI3emFb69Rs1Abhoc+EzGgg2nD1h8u92t0McuCCh8cnFY0JPio77bP/P14mKHy79u/ONF4IIpqgeJR/OMCMRvOkeoMELLk1gpvO2UYYgFNmXWKId6dqLVSTUPmWfWKdA0Rlx9SF+qq7VKAKnuirvgc8o2kNA6BGWMzdZ4FFWsWyuuIkODaYkIVx05ZUWFHX979FURBrKT00HZVE7mOfNd3NkBndxcitnaBGL4uVh44GxwfwGpbwTSwUqvp2upjPt4uGmligskk41dJAnEivSjp9UWVfmVepkiUZBQGfx+DeViIAmJ4WHrxU3Y9Hfj76W3ia53VhQXWHNbcK2et7C55zklTdnHrIyqPANL+ObIqkctLT7VDG5qdTHqtV9JLFCJ8pnhjkcxmPgJPUIW8sgLq78Nr8s5x3vrDnCpQ0dAftQQmIdLbPQMIgAiGVjSIzBpK1QYsjIvecpvFpTajfRp6XEJhK7xgdS4ScICytc8MH6m5v90BcaEENaOPqSq7w7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39830400003)(376002)(396003)(346002)(366004)(451199021)(86362001)(2616005)(2906002)(4744005)(186003)(4326008)(66946007)(41300700001)(66476007)(66556008)(36756003)(6916009)(6512007)(6506007)(44832011)(7416002)(8936002)(5660300002)(8676002)(38100700002)(6486002)(316002)(6666004)(478600001)(54906003);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZzarhNN+vecew2zpFG7ovDCdHs/ZI+5MT3rGhzw2HSUymuonsU6I61SJzcFw?=
 =?us-ascii?Q?L08Dxf8MLcO0AcanKzn+TAia37eSgW8UKkjBe3K9wr0kOtVJKJVLCriR1vmf?=
 =?us-ascii?Q?OYi5Eq27K+j1qhURDnAZfk/th52gF2arvRSp4PoiinSqXLr9zQoz3iv1a/um?=
 =?us-ascii?Q?bXhBfXPHJ0cleT4vNfVWo3Nf9IGWB4UalV/5tebIUxPmY4SFM3FmQrTyy/lm?=
 =?us-ascii?Q?TzoO4kAeGetjqzU3a/gSYIr+b2iPbsNdEbrnDdLiTlKPfwWPdRf0JwUfPw6Y?=
 =?us-ascii?Q?3/CU7wvJKAwMeUA1KGfPqYfDfUX66C+TKfmc5qoPhMJjH7f3tjvEYINWcdxm?=
 =?us-ascii?Q?JCQt+libUg5KoXRLG5td4MO3THl5KQei2PbKCNpdCphTjkPZdnXTiLvkYuGN?=
 =?us-ascii?Q?jy4Jt4UXEJcXBlyp+8Ft32saZgeuv+A8McKoeKQBuFDzNRypIfJwPqHQQDw+?=
 =?us-ascii?Q?r6KpC51ASqAC22htGb1YbLoKSt/3FdlJIw22mHnAvoTfa1IIwVEYmRa91ym0?=
 =?us-ascii?Q?wmbGYNCipmvgmghxgS7HofKo7lV14GJyoQlrawenWBak1HrhoomCYMaa3SCN?=
 =?us-ascii?Q?UL4KeHLxq6D0Xglv39JBWt1xjkPjCNTya7nT2NBTeByFGWg8zqSWv6Yc88qn?=
 =?us-ascii?Q?vpaxKeXzihc4oIW4mA+NE4Htye3+IiTFm6MlAM7SKuvQI+VicJuGWvNe2goD?=
 =?us-ascii?Q?bEoYX/u41+wS3D0dJ5cDvzk4PUXcPmqrjIzYKRY9tvcXOrEMu7GX5RRb8sF7?=
 =?us-ascii?Q?aK5HkOqvph2kVGFFYU9SpVkRryguZZ2lqklf6N6kEes+pcD92aamQPcRCV7s?=
 =?us-ascii?Q?a+vsgwy3OCkoLWCB0dkWdIFnIXJxg64BbGmqQ1+Hj89tKXQBzcZdcAKgzGxj?=
 =?us-ascii?Q?YQ4SBpSMJvKUxy1d8Jez6Kh8gWEwSQHBri3eWpwoUyLaFm75JB08I4tOBUUC?=
 =?us-ascii?Q?IfWfPhMsTK8Wakwgg2+Vzwgj0ekPCRYUnvSEUcWJQSN4Uv5AEIEJdIKs5jIh?=
 =?us-ascii?Q?TQewNV6Ks+bCiVWQkRR7xYwLf00PlYzWLGIfDrgWJMu2MhUkpxqpQAWoio/R?=
 =?us-ascii?Q?0Y8idv6jjdzoMOItS6Kl7WDzG6f1A7znR3TIouoSaDGa9swn2Mli5tI9mmvZ?=
 =?us-ascii?Q?iRkjaktQ089AX6lgg5fBiR8Bq5T+bJo+rMlfF8F80+tlgpufWfYbarro7bm5?=
 =?us-ascii?Q?kZWuUjn8tS7cHMBGyPTrhL/juJLhniIkid6ukh7r//1c4lNU1+Rj6mRdQdbG?=
 =?us-ascii?Q?Jt+IuTmQHrfpTr3KPpBLEzDEu/S15Z4ajDEWfa3VEXnZFLvpEDx1zfSsr3hx?=
 =?us-ascii?Q?GS5PiD9OMi0DxmI4UhhfUI1oREAe5V4rORiaBFcCMaSCBka/q66Tudp2sOZu?=
 =?us-ascii?Q?JnMEsxoaZ/RWWXNByXUwnP90esiE7RRNPYt/g37ya6ffzEvpMOqXCcdsiO7U?=
 =?us-ascii?Q?NqwH6qRHozT3BuLN0kTuxQH7WgL/U7TLHOJtCVShNpPCk162hQF9EBS0KgLc?=
 =?us-ascii?Q?6lC1vPuMa/Ms61TmPf/9Xub3HVSSQ7U0J2P9Ha8r1UL12ZXeiplzVH25d2A0?=
 =?us-ascii?Q?sfK5mN5ynrmuGyRAd8svZyNGG7RPqDzK0yr8VZzHHHZ5ldtAvVvdYBS16sGX?=
 =?us-ascii?Q?14S+WkibBairQ6bknYOy++o8NUFZ8kPJq6Z2Kz8NVd/oJgmrwq+OP5FHxSh5?=
 =?us-ascii?Q?KZBVbg=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55200223-d275-414b-eb58-08db5ead68e6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2023 12:25:08.6580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLIHxkO10a28tXCgyB5GWmYYchoFQ/f0CGtqxDM6NuUPVvMgj+p1oMJK4nASZwfONJLfBut+UmIte3lrRUOS8E9A3RcrleaFgaF0F1LGwaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR13MB5471
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Sun, 28 May 2023 08:02:25 +0000
Subject: Re: [Linux-cachefs] [PATCH net-next 2/8] Drop the netfs_ prefix
 from netfs_extract_iter_to_sg()
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
Cc: Jens Axboe <axboe@kernel.dk>, Shyam Prasad N <nspmangalore@gmail.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Steve French <sfrench@samba.org>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-cachefs@redhat.com,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: corigine.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 26, 2023 at 03:30:58PM +0100, David Howells wrote:

...

> @@ -1307,7 +1307,7 @@ static ssize_t netfs_extract_xarray_to_sg(struct iov_iter *iter,
>  }
>  
>  /**
> - * netfs_extract_iter_to_sg - Extract pages from an iterator and add ot an sglist
> + * extract_iter_to_sg - Extract pages from an iterator and add ot an sglist

nit: While we are here, perhaps

     s/and add ot an/and add to an/

>   * @iter: The iterator to extract from
>   * @maxsize: The amount of iterator to copy
>   * @sgtable: The scatterlist table to fill in

..

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

